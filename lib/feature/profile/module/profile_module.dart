import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' hide ModularStateX;

import '../../todo/presentation/cubit/todo_cubit.dart';
import '../presentation/screens/screens.dart';

/// Profile feature module.
final profileModule = createModule(
  path: '/profile',
  register: (c) {
    c
      // Routes
      ..route(
        '/settings',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<TodoCubit>(),
          child: const SettingsScreen(),
        ),
      )
      ..route('/privacy', child: (ctx, state) => const PrivacyPolicyScreen());
  },
);
