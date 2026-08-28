import 'package:flutter_modular/flutter_modular.dart';

import '../feature/auth/module/auth_paths.dart';
import '../core/token_storage/domain/i_storage_token_repository.dart';

/// v7 guard: a synchronous function that returns a redirect path or null to allow.
ModularGuard authGuard = (state) {
  try {
    final storage = inject<IStorageTokenRepository>();
    final token = storage.getIdTokenSync();
    if (token != null && token.isNotEmpty) {
      return null; // allow
    }
    return AuthPaths.login; // redirect to login
  } catch (_) {
    // If DI is not ready yet, redirect to login
    return AuthPaths.login;
  }
};
