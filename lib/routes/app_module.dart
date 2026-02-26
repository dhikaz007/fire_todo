import 'package:flutter_modular/flutter_modular.dart';

import '../feature/auth/data/datasources/auth_remote_datasource.dart';
import '../feature/auth/data/repositories/auth_repository_impl.dart';
import '../feature/auth/domain/repositories/i_auth_repository.dart';
import '../feature/auth/presentation/cubit/auth_cubit.dart';
import '../feature/auth/presentation/screens/splash_screen.dart';
import '../feature/home/presentation/screens/screens.dart';
import '../feature/profile/data/datasources/profile_remote_datasources.dart';
import '../feature/profile/data/repositories/profile_repository_impl.dart';
import '../feature/profile/domain/repositories/i_profile_repository.dart';
import '../feature/profile/presentation/cubit/profile_cubit.dart';
import '../feature/todo/data/datasources/todo_remote_datasources.dart';
import '../feature/todo/data/repositories/todo_repository_impl.dart';
import '../feature/todo/domain/repositories/i_todo_repository.dart';
import '../feature/todo/presentation/cubit/todo_cubit.dart';
import '../shared/local_db/domain/i_hive_repository.dart';
import '../shared/network/dio_client.dart';
import '../shared/storage/domain/i_storage_token_repository.dart';
import '../shared/widgets/not_found.dart';
import 'auth_guard.dart';
import 'auth_module.dart';
import 'notifications_module.dart';
import 'profile_module.dart';
import 'services_module.dart';
import 'todo_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const SplashScreen(),
      transition: TransitionType.fadeIn,
    );
    r.wildcard(
        child: (_) => const NotFoundScreen(),
        transition: TransitionType.fadeIn);
    r.child('/main',
        child: (_) => const MainScreen(),
        transition: TransitionType.fadeIn,
        guards: [AuthGuard()]);
    r.module('/auth', module: AuthModule(), transition: TransitionType.fadeIn);
    r.module('/todo', module: TodoModule(), transition: TransitionType.fadeIn);
    r.module('/profile',
        module: ProfileModule(), transition: TransitionType.fadeIn);
    r.module('/notifications',
        module: NotificationsModule(), transition: TransitionType.fadeIn);
  }

  @override
  List<Module> get imports => [ServicesModule()];

  @override
  void binds(i) {
    i.addSingleton(AuthGuard.new);

    i.addLazySingleton(() =>
        AuthRemoteDatasource(dio: i.get<DioClient>().getDio(ApiType.identity)));
    i.addLazySingleton<IAuthRepository>(() => AuthRepositoryImpl(
          remoteDatasource: i.get<AuthRemoteDatasource>(),
          storageTokenRepository: i.get<IStorageTokenRepository>(),
          hiveRepository: i.get<IHiveRepository>(),
        ));
    i.add<AuthCubit>(
      () => AuthCubit(
        iAuthRepository: i.get<IAuthRepository>(),
        iStorageTokenRepository: i.get<IStorageTokenRepository>(),
        iHiveRepository: i.get<IHiveRepository>(),
      ),
    );

    i.addLazySingleton(
      () => TodoRemoteDatasources(
          dio: i.get<DioClient>().getDio(ApiType.firestore),
          iHiveRepository: i.get<IHiveRepository>()),
    );
    i.addLazySingleton<ITodoRepository>(TodoRepositoryImpl.new);
    i.add<TodoCubit>(
      () => TodoCubit(iTodoRepository: i.get<ITodoRepository>()),
    );

    i.addLazySingleton(
      () => ProfileRemoteDatasources(
          dio: i.get<DioClient>().getDio(ApiType.identity)),
    );
    i.addLazySingleton<IProfileRepository>(ProfileRepositoryImpl.new);
    i.add<ProfileCubit>(
      () => ProfileCubit(
        iProfileRepository: i.get<IProfileRepository>(),
        iHiveRepository: i.get<IHiveRepository>(),
        iStorageTokenRepository: i.get<IStorageTokenRepository>(),
      ),
    );
  }
}
