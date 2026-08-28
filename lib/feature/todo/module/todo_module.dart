import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' hide ModularStateX;

import '../domain/models/models.dart';
import '../presentation/cubit/todo_cubit.dart';
import '../presentation/screens/screens.dart';

/// Todo feature module.
final todoModule = createModule(
  path: '/todo',
  register: (c) {
    c
      // Routes
      ..route(
        '/create',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<TodoCubit>(),
          child: const CreateTodoScreen(),
        ),
      )
      ..route('/edit', child: (ctx, state) => const EditTodoScreen())
      ..route('/detail', child: (ctx, state) {
        final args = state.arguments;
        if (args is! DocumentModel) {
          return const SizedBox.shrink();
        }
        return BlocProvider(
          create: (_) => inject<TodoCubit>(),
          child: DetailTodoScreen(document: args),
        );
      })
      ..route(
        '/list',
        child: (ctx, state) => BlocProvider(
          create: (_) => inject<TodoCubit>(),
          child: const ListTodoScreen(),
        ),
      );
  },
);
