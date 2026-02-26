import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/models/error_response_model.dart';
import '../shared/storage/data/storage_token_repository_impl.dart';

extension DioErrorExtension on DioException {
  String errorMessageCustom() {
    final code = response?.statusCode ?? 0;

    String? apiMessage;
    try {
      final raw = response?.data;
      Map<String, dynamic>? map;

      if (raw is String) {
        final decoded = json.decode(raw);
        if (decoded is Map<String, dynamic>) map = decoded;
      } else if (raw is Map) {
        map = Map<String, dynamic>.from(raw);
      }

      final errMap = map != null && map['error'] is Map
          ? Map<String, dynamic>.from(map['error'] as Map)
          : map;

      if (errMap != null) {
        try {
          final err = ErrorResponseModel.fromJson(errMap);
          apiMessage = err.message ??
              (err.errors?.isNotEmpty == true
                  ? err.errors!.first.message
                  : null);
        } catch (_) {
          apiMessage = errMap['message']?.toString() ??
              (errMap['errors'] is List && (errMap['errors'] as List).isNotEmpty
                  ? ((errMap['errors'] as List).first as Map)['message']
                      ?.toString()
                  : null) ??
              errMap['error_description']?.toString() ??
              errMap['detail']?.toString();
        }
      }
    } catch (_) {}

    switch (type) {
      case DioExceptionType.connectionTimeout:
        return "⏳ Timeout - Tidak bisa terhubung ke server";
      case DioExceptionType.receiveTimeout:
        return "⏳ Timeout - Server terlalu lama merespons";
      case DioExceptionType.badCertificate:
        return "🔑 Sertifikat SSL tidak valid";
      case DioExceptionType.connectionError:
        return "📡 Koneksi gagal - Periksa internet Anda";
      default:
        break;
    }

    switch (code) {
      case 200:
        return "✅ OK - Request berhasil";
      case 201:
        return "✅ Created - Data berhasil dibuat";
      case 204:
        return "ℹ️ No Content - Tidak ada data dikembalikan";
      case 400:
        return apiMessage ?? "⚠️ Bad Request";
      case 401:
        unawaited(StorageTokenRepositoryImpl().removeAllToken());
        scheduleMicrotask(() => Modular.to.navigate('/'));
        return apiMessage ??
            "🔒 Unauthorized - Sesi habis atau token tidak valid";
      case 403:
        return apiMessage ?? "⛔ Forbidden - Akses ditolak";
      case 404:
        return apiMessage ?? "❓ Not Found - Data tidak ditemukan";
      case 422:
        return apiMessage ?? "⚠️ Validasi gagal";
      case 500:
        return apiMessage ?? "💥 Server Error - Terjadi kesalahan di server";
      default:
        return apiMessage ??
            "❌ Error - ${message ?? 'Unknown error'} (status: $code)";
    }
  }
}
