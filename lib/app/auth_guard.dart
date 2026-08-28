import 'package:flutter_modular/flutter_modular.dart';

import '../feature/auth/module/auth_paths.dart';
import '../core/token_storage/domain/i_storage_token_repository.dart';

/// v7 guard: a synchronous function that returns a redirect path or null to allow.
ModularGuard authGuard = (state) {
  final storage = inject<IStorageTokenRepository>();
  // Note: v7 guards are synchronous. Token check must be done synchronously.
  // We use a cached token check here.
  final token = storage.getIdTokenSync();
  if (token != null && token.isNotEmpty) {
    return null; // allow
  }
  return AuthPaths.login; // redirect to login
};
