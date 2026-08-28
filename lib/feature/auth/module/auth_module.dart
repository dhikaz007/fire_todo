import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/user_local/domain/i_hive_repository.dart';
import '../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../data/datasources/auth_remote_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/i_auth_repository.dart';
import '../presentation/cubit/auth_cubit.dart';
import '../presentation/screens/screens.dart';

/// Helper to resolve dependencies during module registration.
T _get<T>() => inject<T>();

/// Auth feature module.
/// Mount path is declared here; parent just calls `c.module(authModule)`.
final authModule = createModule(
  path: '/auth',
  register: (c) {
    c
      // Binds
      ..addLazySingleton(
        () => AuthRemoteDatasource(
          dio: _get<DioClient>().getDio(ApiType.identity),
        ),
      )
      ..addLazySingleton<IAuthRepository>(
        () => AuthRepositoryImpl(
          remoteDatasource: _get<AuthRemoteDatasource>(),
          storageTokenRepository: _get<IStorageTokenRepository>(),
          hiveRepository: _get<IHiveRepository>(),
        ),
      )
      ..add<AuthCubit>(
        () => AuthCubit(
          iAuthRepository: _get<IAuthRepository>(),
          iStorageTokenRepository: _get<IStorageTokenRepository>(),
          iHiveRepository: _get<IHiveRepository>(),
        ),
      )
      // Routes
      ..route('/', child: (ctx, state) => const LoginScreen())
      ..route('/sign-up', child: (ctx, state) => const SignUpScreen())
      ..route('/verify', child: (ctx, state) => const VerifyEmailScreen());
  },
);
