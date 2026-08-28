import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/user_local/domain/i_hive_repository.dart';
import '../data/datasources/todo_remote_datasources.dart';
import '../data/repositories/todo_repository_impl.dart';
import '../domain/models/models.dart';
import '../domain/repositories/i_todo_repository.dart';
import '../presentation/cubit/todo_cubit.dart';
import '../presentation/screens/screens.dart';

/// Helper to resolve dependencies during module registration.
T _get<T>() => inject<T>();

/// Todo feature module.
final todoModule = createModule(
  path: '/todo',
  register: (c) {
    c
      // Binds
      ..addLazySingleton(
        () => TodoRemoteDatasources(
          dio: _get<DioClient>().getDio(ApiType.firestore),
          iHiveRepository: _get<IHiveRepository>(),
        ),
      )
      ..addLazySingleton<ITodoRepository>(TodoRepositoryImpl.new)
      ..add<TodoCubit>(
        () => TodoCubit(iTodoRepository: _get<ITodoRepository>()),
      )
      // Routes
      ..route('/create', child: (ctx, state) => const CreateTodoScreen())
      ..route('/edit', child: (ctx, state) => const EditTodoScreen())
      ..route('/detail', child: (ctx, state) {
        final args = state.arguments;
        if (args is! DocumentModel) {
          return const SizedBox.shrink();
        }
        return DetailTodoScreen(document: args);
      })
      ..route('/list', child: (ctx, state) => const ListTodoScreen());
  },
);
