import 'package:shared_preferences/shared_preferences.dart';

import '../domain/i_storage_token_repository.dart';

class StorageTokenRepositoryImpl implements IStorageTokenRepository {
  SharedPreferences? _prefsInstance;
  String? _cachedIdToken;
  final String _idTokenKey = 'id_token';
  final String _refreshTokenKey = 'refresh_token';

  Future<SharedPreferences> get _prefs async {
    _prefsInstance ??= await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  @override
  Future<void> setIdToken(String value) async {
    final prefs = await _prefs;
    await prefs.setString(_idTokenKey, value);
    _cachedIdToken = value;
  }

  @override
  Future<void> setRefreshToken(String value) async {
    final prefs = await _prefs;
    await prefs.setString(_refreshTokenKey, value);
  }

  @override
  Future<String?> getIdToken() async {
    final prefs = await _prefs;
    final token = prefs.getString(_idTokenKey);
    _cachedIdToken = token;
    return token;
  }

  @override
  String? getIdTokenSync() {
    return _cachedIdToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    final prefs = await _prefs;
    return prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> removeAllToken() async {
    final prefs = await _prefs;
    await prefs.clear();
    _cachedIdToken = null;
  }
}
