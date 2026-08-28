import 'package:flutter_modular/flutter_modular.dart';

import 'app_paths.dart';
import 'services_module.dart';
import '../feature/auth/module/auth_module.dart';
import '../feature/auth/presentation/screens/splash_screen.dart';
import '../feature/home/presentation/screens/screens.dart';
import '../feature/notifications/module/notifications_module.dart';
import '../feature/profile/module/profile_module.dart';
import '../feature/todo/module/todo_module.dart';
import 'auth_guard.dart';

/// Root app module.
/// Core services are registered in [servicesModule].
/// Feature binds & routes are handled by each feature module.
final appModule = createModule(
  register: (c) {
    c
      // Core Services
      ..module(servicesModule)
      // Guards
      ..addSingleton(authGuard)
      // Root Routes
      ..route(
        AppPaths.splash,
        child: (ctx, state) => const SplashScreen(),
        transition: TransitionType.fade,
      )
      ..route(
        AppPaths.main,
        child: (ctx, state) => const MainScreen(),
        transition: TransitionType.fade,
        guards: [authGuard],
      )
      // Feature Modules
      ..module(authModule)
      ..module(todoModule)
      ..module(profileModule)
      ..module(notificationsModule);
  },
);
