part of 'storage.dart';

abstract class StorageTokenRepository {
  Future<void> setIdToken(String value);
  Future<void> setRefreshToken(String value);
  Future<String?> getIdToken();
  Future<String?> getRefreshToken();
  Future<void> removeAllToken();
}

class StorageTokenService implements StorageTokenRepository {
  SharedPreferences? _prefsInstance;
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
  }

  @override
  Future<void> setRefreshToken(String value) async {
    final prefs = await _prefs;
    await prefs.setString(_refreshTokenKey, value);
  }

  @override
  Future<String?> getIdToken() async {
    final prefs = await _prefs;
    return prefs.getString(_idTokenKey);
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
  }
}

class StorageTokenController extends ChangeNotifier implements Disposable {
  final StorageTokenRepository repository;

  String? _idToken;
  String? _refreshToken;
  bool _isLoading = false;

  String? get idToken => _idToken;
  String? get refreshToken => _refreshToken;
  bool get isLoading => _isLoading;

  VoidCallback? onNavigationReady;

  StorageTokenController(this.repository) {
    _loadTokens();
  }

  Future<void> _loadTokens() async {
    _isLoading = true;
    notifyListeners();

    _idToken = await repository.getIdToken();
    _refreshToken = await repository.getRefreshToken();

    _isLoading = false;
    notifyListeners();

    onNavigationReady?.call();
  }

  Future<void> saveIdToken(String value) async {
    _isLoading = true;
    notifyListeners();
    await repository.setIdToken(value);
    await _loadTokens();
  }

  Future<void> saveRefreshToken(String value) async {
    _isLoading = true;
    notifyListeners();
    await repository.setRefreshToken(value);
    await _loadTokens();
  }

  Future<void> removeAllTokens() async {
    _isLoading = true;
    notifyListeners();
    await repository.removeAllToken();
    await _loadTokens();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("StorageController di-dispose oleh Modular.");
  }
}
