import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/user_local/domain/i_hive_repository.dart';
import '../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../data/datasources/profile_remote_datasources.dart';
import '../data/repositories/profile_repository_impl.dart';
import '../domain/repositories/i_profile_repository.dart';
import '../presentation/cubit/profile_cubit.dart';
import '../presentation/screens/screens.dart';

/// Helper to resolve dependencies during module registration.
T _get<T>() => inject<T>();

/// Profile feature module.
final profileModule = createModule(
  path: '/profile',
  register: (c) {
    c
      // Binds
      ..addLazySingleton(
        () => ProfileRemoteDatasources(
          dio: _get<DioClient>().getDio(ApiType.identity),
        ),
      )
      ..addLazySingleton<IProfileRepository>(ProfileRepositoryImpl.new)
      ..add<ProfileCubit>(
        () => ProfileCubit(
          iProfileRepository: _get<IProfileRepository>(),
          iHiveRepository: _get<IHiveRepository>(),
          iStorageTokenRepository: _get<IStorageTokenRepository>(),
        ),
      )
      // Routes
      ..route('/settings', child: (ctx, state) => const SettingsScreen())
      ..route('/privacy', child: (ctx, state) => const PrivacyPolicyScreen());
  },
);
