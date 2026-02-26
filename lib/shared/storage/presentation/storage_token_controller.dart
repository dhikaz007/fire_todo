import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/i_storage_token_repository.dart';

class StorageTokenController extends ChangeNotifier implements Disposable {
  final IStorageTokenRepository repository;

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
