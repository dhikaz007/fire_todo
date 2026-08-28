import 'package:flutter_modular/flutter_modular.dart';

import '../core/network/dio_client.dart';
import '../core/services/fcm_service.dart';
import '../core/token_storage/data/storage_token_repository_impl.dart';
import '../core/token_storage/domain/i_storage_token_repository.dart';
import '../core/token_storage/presentation/storage_token_controller.dart';
import '../core/user_local/data/hive_repository_impl.dart';
import '../core/user_local/domain/i_hive_repository.dart';
import '../core/user_local/presentation/hive_controller.dart';
import '../feature/auth/data/datasources/auth_remote_datasource.dart';
import '../feature/auth/data/repositories/auth_repository_impl.dart';
import '../feature/auth/domain/repositories/i_auth_repository.dart';
import '../feature/auth/presentation/cubit/auth_cubit.dart';
import '../feature/profile/data/datasources/profile_remote_datasources.dart';
import '../feature/profile/data/repositories/profile_repository_impl.dart';
import '../feature/profile/domain/repositories/i_profile_repository.dart';
import '../feature/profile/presentation/cubit/profile_cubit.dart';
import '../feature/todo/data/datasources/todo_remote_datasources.dart';
import '../feature/todo/data/repositories/todo_repository_impl.dart';
import '../feature/todo/domain/repositories/i_todo_repository.dart';
import '../feature/todo/presentation/cubit/todo_cubit.dart';

abstract class IAppNavigationRepository {
  void navigateToLoginAndClearStack();
}

class AppNavigationRepositoryImpl implements IAppNavigationRepository {
  @override
  void navigateToLoginAndClearStack() {
    // In v7, navigation requires a BuildContext.
    // This is called from DioClient interceptor which has no context.
    // We use a GlobalKey<NavigatorState> approach via ModularApp.
    // For now, this is handled differently - see DioClient._handleAuthError
  }
}

final servicesModule = createModule(
  register: (c) {
    c
      // Core
      ..addLazySingleton(DioClient.new)
      ..addLazySingleton<IAppNavigationRepository>(
          AppNavigationRepositoryImpl.new)
      ..addLazySingleton<IStorageTokenRepository>(
          StorageTokenRepositoryImpl.new)
      ..addSingleton<StorageTokenController>(StorageTokenController.new)
      ..addLazySingleton<IHiveRepository>(HiveRepositoryImpl.new)
      ..addSingleton<HiveController>(HiveController.new)
      ..addLazySingleton<FcmService>(FcmService.new)
      // Auth
      ..addLazySingleton(
        () => AuthRemoteDatasource(
          dio: inject<DioClient>().getDio(ApiType.identity),
        ),
      )
      ..addLazySingleton<IAuthRepository>(
        () => AuthRepositoryImpl(
          remoteDatasource: inject<AuthRemoteDatasource>(),
          storageTokenRepository: inject<IStorageTokenRepository>(),
          hiveRepository: inject<IHiveRepository>(),
        ),
      )
      ..add<AuthCubit>(
        () => AuthCubit(
          iAuthRepository: inject<IAuthRepository>(),
          iStorageTokenRepository: inject<IStorageTokenRepository>(),
          iHiveRepository: inject<IHiveRepository>(),
        ),
      )
      // Profile
      ..addLazySingleton(
        () => ProfileRemoteDatasources(
          dio: inject<DioClient>().getDio(ApiType.identity),
        ),
      )
      ..addLazySingleton<IProfileRepository>(ProfileRepositoryImpl.new)
      ..add<ProfileCubit>(
        () => ProfileCubit(
          iProfileRepository: inject<IProfileRepository>(),
          iHiveRepository: inject<IHiveRepository>(),
          iStorageTokenRepository: inject<IStorageTokenRepository>(),
        ),
      )
      // Todo
      ..addLazySingleton(
        () => TodoRemoteDatasources(
          dio: inject<DioClient>().getDio(ApiType.firestore),
          iHiveRepository: inject<IHiveRepository>(),
        ),
      )
      ..addLazySingleton<ITodoRepository>(TodoRepositoryImpl.new)
      ..add<TodoCubit>(
        () => TodoCubit(iTodoRepository: inject<ITodoRepository>()),
      );
  },
);
