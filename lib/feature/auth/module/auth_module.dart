import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' hide ModularStateX;

import '../presentation/cubit/auth_cubit.dart';
import '../presentation/screens/screens.dart';

/// Auth feature module.
/// Mount path is declared here; parent just calls `c.module(authModule)`.
final authModule = createModule(
  path: '/auth',
  register: (c) {
    c
      // Routes
      ..route(
        '/',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<AuthCubit>(),
          child: const LoginScreen(),
        ),
      )
      ..route(
        '/sign-up',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<AuthCubit>(),
          child: const SignUpScreen(),
        ),
      )
      ..route(
        '/verify',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<AuthCubit>(),
          child: const VerifyEmailScreen(),
        ),
      );
  },
);
