abstract class IStorageTokenRepository {
  Future<void> setIdToken(String value);
  Future<void> setRefreshToken(String value);
  Future<String?> getIdToken();
  Future<String?> getRefreshToken();
  Future<void> removeAllToken();
  /// Synchronous token check for v7 guards (returns cached value).
  String? getIdTokenSync();
}
