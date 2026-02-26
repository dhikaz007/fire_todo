abstract class IStorageTokenRepository {
  Future<void> setIdToken(String value);
  Future<void> setRefreshToken(String value);
  Future<String?> getIdToken();
  Future<String?> getRefreshToken();
  Future<void> removeAllToken();
}
