part of 'services.dart';

enum ApiType { identity, firestore }

mixin BaseServices {
  static final Map<ApiType, Dio> _dioCache = {};

  Completer<void>? _refreshCompleter;
  final List<Future<void> Function()> _pending401 = [];
  final _log = AppLogger();

  Future<String> initPlatformState() async {
    String platformVersion;
    try {
      // platformVersion = FkUserAgent.userAgent ?? '-';
      platformVersion = await DeviceUserAgent.instance.build();
      debugPrint(platformVersion);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    return platformVersion;
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

  Future<Dio> dio(ApiType type) async {
    if (_dioCache.containsKey(type)) {
      return _dioCache[type]!;
    }

    final newDio = Dio(_buildOptions(type));
    newDio.interceptors.add(_createInterceptor());
    _dioCache[type] = newDio;
    return newDio;
  }

  InterceptorsWrapper _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        await _setHeaders(options);
        handler.next(options);
      },
      onResponse: (resp, handler) {
        final status = resp.statusCode ?? 0;
        final level = _log.levelForStatus(status);
        final msg = '''
⬅️ RESPONSE [$status] ${resp.requestOptions.method} ${resp.requestOptions.uri}
Headers: ${_log.prettyJson(resp.headers.map)}
Data: ${_log.prettyJson(resp.data)}
''';
        switch (level) {
          case Level.info:
            _log.i(msg);
            break;
          case Level.debug:
            _log.d(msg);
            break;
          case Level.warning:
            _log.w(msg);
            break;
          case Level.error:
            _log.e(msg);
            break;
          default:
            _log.d(msg);
        }
        handler.next(resp);
      },
      onError: (e, handler) async {
        // 1. Log error terlebih dahulu untuk debugging.
        _logError(e);

        final req = e.requestOptions;
        final isAuthErr =
            (e.response?.statusCode == 401 || e.response?.statusCode == 403);

        // 2. Jika bukan error auth atau adalah endpoint login/secure-token, lanjutkan error.
        if (!isAuthErr || _isLogin(req) || _isSecureToken(req)) {
          return handler.next(e);
        }

        // 3. Jika error auth, delegasikan ke fungsi khusus.
        await _handleAuthError(e, handler);
      },
    );
  }

  Future<void> _handleAuthError(
      DioException e, ErrorInterceptorHandler handler) async {
    final req = e.requestOptions;

    if (_refreshCompleter != null) {
      _pending401.add(() async {
        final newId = await StorageTokenService().getIdToken();
        final r = await _retryWithBearer(_dioCache[ApiType.identity]!, req,
            bearer: newId ?? '');
        _log.d(
            '''✅ RETRY RESOLVED [${r.statusCode}] ${req.method} ${req.uri}''');
        handler.resolve(r);
      });
      return;
    }

    _refreshCompleter = Completer<void>();
    try {
      // ... (logika refresh token sama persis seperti sebelumnya) ...
      final rt = await StorageTokenService().getRefreshToken();
      if (rt?.isNotEmpty == true && req.data is! FormData) {
        try {
          final r1 = await _retryWithBearer(_dioCache[ApiType.identity]!, req,
              bearer: rt!);
          _refreshCompleter?.complete();
          _refreshCompleter = null;
          _processPendingQueue();
          _log.d(
              '''✅ RETRY (refreshToken) [${r1.statusCode}] ${req.method} ${req.uri}''');
          return handler.resolve(r1);
        } on DioException catch (e1) {
          final st = e1.response?.statusCode;
          if (st != 401 && st != 403) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
            _processPendingQueue();
            return handler.next(e1);
          }
        }
      }

      await _exchangeViaSecureToken();
      final newId = await StorageTokenService().getIdToken();
      if (newId?.isEmpty != false) throw StateError('No new idToken');

      final r2 = await _retryWithBearer(_dioCache[ApiType.identity]!, req,
          bearer: newId!);
      _refreshCompleter?.complete();
      _refreshCompleter = null;
      _processPendingQueue();
      _log.d(
          '''✅ RETRY (secureToken) [${r2.statusCode}] ${req.method} ${req.uri}''');
      return handler.resolve(r2);
    } catch (err) {
      _refreshCompleter?.completeError(err);
      _refreshCompleter = null;
      _processPendingQueue();

      await StorageTokenService().removeAllToken();

      try {
        Modular.get<AppNavigationService>().navigateToLoginAndClearStack();
      } catch (e) {
        _log.e(
            'NavigationService not found in Modular. Make sure it is bound. Error: $e');
        Modular.to.pushNamedAndRemoveUntil('/login', (route) => false);
      }

      return handler.next(e);
    }
  }

  void _processPendingQueue() {
    for (final job in _pending401) {
      job();
    }
    _pending401.clear();
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

  Future<void> _setHeaders(RequestOptions options) async {
    final idToken = await StorageTokenService().getIdToken();
    final platform = await initPlatformState();

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

  Future<Response<dynamic>> _retryWithBearer(
    Dio dio,
    RequestOptions original, {
    required String bearer,
  }) {
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
    final rt = await StorageTokenService().getRefreshToken();
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

    await StorageTokenService().setIdToken(newId);
    await StorageTokenService().setRefreshToken(newRt);
  }
}
