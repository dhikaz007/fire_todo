part of 'routes.dart';

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
    i.addSingleton(() => AuthGuard());

    i.addLazySingleton<AuthRepository>(() => AuthServices(
          storageTokenRepository: i.get(),
          hiveRepository: i.get(),
        ));
    i.addLazySingleton<AuthCubit>(
      () => AuthCubit(
        authRepository: i.get<AuthRepository>(),
        storageRepository: i.get<StorageTokenRepository>(),
        hiveRepository: i.get<HiveRepository>(),
      ),
      config: BindConfig(onDispose: (value) => value.close()),
    );

    i.addLazySingleton<TodoRepository>(
        () => TodoServices(hiveRepository: i.get()));
    i.addLazySingleton<TodoCubit>(
      () => TodoCubit(
          todoRepository: i.get<TodoRepository>(), hiveRepository: i.get()),
      config: BindConfig(onDispose: (value) => value.close()),
    );

    i.addLazySingleton<ProfileRepository>(
        () => ProfileServices(storageTokenRepository: i.get()));
    i.addLazySingleton<ProfileCubit>(
      () => ProfileCubit(
        profileRepository: i.get<ProfileRepository>(),
        hiveRepository: i.get<HiveRepository>(),
        storageTokenRepository: i.get(),
      ),
      config: BindConfig(onDispose: (value) => value.close()),
    );
  }
}
