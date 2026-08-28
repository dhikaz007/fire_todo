import 'dart:async';

import 'package:device_meta/device_meta.dart';
import 'package:dio/dio.dart';

import '../constant/url.dart';
import '../navigation/navigation_service.dart';
import '../logging/app_logger.dart';
import '../token_storage/data/storage_token_repository_impl.dart';

enum ApiType { identity, firestore }

class DioClient {
  final Map<ApiType, Dio> _dioCache = {};

  Completer<void>? _refreshCompleter;
  final List<Future<void> Function()> _pending401 = [];

  final _log = AppLogger();

  DioClient();

  Dio getDio(ApiType type) {
    if (_dioCache.containsKey(type)) {
      return _dioCache[type]!;
    }

    final newDio = Dio(_buildOptions(type));
    newDio.interceptors.add(_createInterceptor());
    _dioCache[type] = newDio;
    return newDio;
  }

  BaseOptions _buildOptions(ApiType type) {
    final baseUrl = switch (type) {
      ApiType.identity => UrlApp.baseUrl,
      ApiType.firestore => UrlApp.fireStoreUrl,
    };

    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
      headers: {'Content-Type': 'application/json'},
      queryParameters: {"key": UrlApp.apiKey},
    );
  }

  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        await _setHeaders(options);
        return handler.next(options);
      },
      onResponse: (resp, handler) {
        _logResponse(resp);
        return handler.next(resp);
      },
      onError: (e, handler) async {
        _logError(e);

        final req = e.requestOptions;
        final isAuthErr =
            (e.response?.statusCode == 401 || e.response?.statusCode == 403);

        if (!isAuthErr || _isLogin(req) || _isSecureToken(req)) {
          return handler.next(e);
        }

        await _handleAuthError(e, handler);
      },
    );
  }

  Future<void> _handleAuthError(
      DioException e, ErrorInterceptorHandler handler) async {
    final req = e.requestOptions;

    if (_refreshCompleter != null) {
      _pending401.add(() async {
        final newId = await StorageTokenRepositoryImpl().getIdToken();
        final r = await _retryWithBearer(getDio(ApiType.identity), req,
            bearer: newId ?? '');
        _log.d('✅ RETRY RESOLVED [${r.statusCode}] ${req.method} ${req.uri}');
        handler.resolve(r);
      });
      return;
    }

    _refreshCompleter = Completer<void>();
    try {
      final rt = await StorageTokenRepositoryImpl().getRefreshToken();
      if (rt?.isNotEmpty == true && req.data is! FormData) {
        try {
          final r1 = await _retryWithBearer(getDio(ApiType.identity), req,
              bearer: rt!);
          _finishRefresh();
          _log.d(
              '✅ RETRY (refreshToken) [${r1.statusCode}] ${req.method} ${req.uri}');
          return handler.resolve(r1);
        } on DioException catch (e1) {
          final st = e1.response?.statusCode;
          if (st != 401 && st != 403) {
            _finishRefresh();
            return handler.next(e1);
          }
        }
      }

      await _exchangeViaSecureToken();
      final newId = await StorageTokenRepositoryImpl().getIdToken();
      if (newId?.isEmpty != false) throw StateError('No new idToken');

      final r2 =
          await _retryWithBearer(getDio(ApiType.identity), req, bearer: newId!);
      _finishRefresh();
      _log.d(
          '✅ RETRY (secureToken) [${r2.statusCode}] ${req.method} ${req.uri}');
      return handler.resolve(r2);
    } catch (err) {
      _refreshCompleter?.completeError(err);
      _refreshCompleter = null;
      _processPendingQueue();

      await StorageTokenRepositoryImpl().removeAllToken();

      try {
        NavigationService.navigateTo('/');
      } catch (e) {
        _log.e('NavigationService error: $e');
      }

      return handler.next(e);
    }
  }

  void _finishRefresh() {
    _refreshCompleter?.complete();
    _refreshCompleter = null;
    _processPendingQueue();
  }

  void _processPendingQueue() {
    for (final job in _pending401) {
      job();
    }
    _pending401.clear();
  }

  Future<void> _setHeaders(RequestOptions options) async {
    final idToken = await StorageTokenRepositoryImpl().getIdToken();
    final platform = DeviceMeta.instance.userAgent ?? 'Unknown';

    options.headers['User-Agent'] = platform;
    options.headers['Content-Type'] = 'application/json';

    final host = options.uri.host;
    final isFirebaseAuth = host.contains('identitytoolkit.googleapis.com') ||
        host.contains('securetoken.googleapis.com');

    if (!isFirebaseAuth && idToken != null && idToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $idToken';
    }
  }

  bool _isLogin(RequestOptions o) =>
      o.path.contains('/accounts:signInWithPassword') ||
      o.path.contains('/accounts:signUp');

  bool _isSecureToken(RequestOptions o) {
    final url = o.baseUrl.isNotEmpty ? '${o.baseUrl}${o.path}' : o.path;
    return url.contains('securetoken.googleapis.com') && url.contains('/token');
  }

  Future<Response<dynamic>> _retryWithBearer(Dio dio, RequestOptions original,
      {required String bearer}) {
    final headers = Map<String, dynamic>.from(original.headers);
    headers['Authorization'] = 'Bearer $bearer';

    return dio.request<dynamic>(
      original.path,
      data: original.data,
      queryParameters: original.queryParameters,
      options: Options(method: original.method, headers: headers),
    );
  }

  Future<void> _exchangeViaSecureToken() async {
    final rt = await StorageTokenRepositoryImpl().getRefreshToken();
    if (rt == null || rt.isEmpty) throw StateError('No refresh token');

    final d = Dio(BaseOptions(
      baseUrl: UrlApp.secureTokenUrl,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    ));

    final resp = await d.post<Map<String, dynamic>>(
      '/token?key=${UrlApp.apiKey}',
      data: {'grant_type': 'refresh_token', 'refresh_token': rt},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    final m = resp.data ?? {};
    final newId = (m['id_token'] ?? m['idToken']) as String?;
    final newRt = (m['refresh_token'] ?? m['refreshToken']) as String?;
    if (newId == null || newRt == null) {
      throw StateError('Invalid refresh response');
    }

    await StorageTokenRepositoryImpl().setIdToken(newId);
    await StorageTokenRepositoryImpl().setRefreshToken(newRt);
  }

  void _logResponse(Response resp) {
    final status = resp.statusCode ?? 0;
    final msg = '''
⬅️ RESPONSE [$status] ${resp.requestOptions.method} ${resp.requestOptions.uri}
Headers: ${_log.prettyJson(resp.headers.map)}
Data: ${_log.prettyJson(resp.data)}
''';
    _log.i(msg); // Sesuaikan level log sesuai kebutuhan Anda
  }

  void _logError(DioException e) {
    final req = e.requestOptions;
    final status = e.response?.statusCode;
    final errMsg = '''
❌ ERROR ${status ?? '-'} ${req.method} ${req.uri}
Type: ${e.type}
Message: ${e.message}
ReqHeaders: ${_log.prettyJson(req.headers)}
ReqData: ${_log.prettyJson(req.data)}
RespHeaders: ${_log.prettyJson(e.response?.headers.map)}
RespData: ${_log.prettyJson(e.response?.data)}
''';
    _log.e(errMsg);
  }
}
