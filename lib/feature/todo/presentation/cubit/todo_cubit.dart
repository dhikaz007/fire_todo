import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/models.dart';
import '../../domain/repositories/i_todo_repository.dart';

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final ITodoRepository _iTodoRepository;

  TodoCubit({
    required ITodoRepository iTodoRepository,
  })  : _iTodoRepository = iTodoRepository,
        super(const TodoState.initial());

  bool get _isLoading => state is _Loading;

  void loadTodo() async {
    if (_isLoading) return;
    try {
      emit(const TodoState.loading());
      final response = await _iTodoRepository.fetchListTodo();
      emit(TodoState.loaded(response: response.data ?? const ListTodoModel()));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }

  void createTodo({
    required String title,
    required String description,
    required DateTime createdAt,
    required bool isDone,
  }) async {
    if (_isLoading) return;
    try {
      emit(const TodoState.loading());
      final response = await _iTodoRepository.postTodo(
          title, description, createdAt, isDone);
      emit(TodoState.add(response: response.data ?? const DocumentModel()));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }

  void editTodo({
    required String id,
    required String title,
    required String description,
    required bool isDone,
    required DateTime dueDate,
  }) async {
    try {
      emit(const TodoState.loading());
      final response = await _iTodoRepository.patchTodo(
          id, title, description, isDone, dueDate);
      emit(TodoState.edit(response: response.data ?? const DocumentModel()));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }

  void deleteTodo({required String id}) async {
    try {
      emit(const TodoState.loading());

      await _iTodoRepository.deleteTodo(id);
      emit(const TodoState.delete(response: 'Data deleted'));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }

  void detailTodo({required String id}) async {
    try {
      emit(const TodoState.loading());

      final response = await _iTodoRepository.fetchTodoDetail(id);
      emit(TodoState.detail(response: response.data ?? const DocumentModel()));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }

  void deleteAllTodo() async {
    try {
      emit(const TodoState.loading());
      final response = await _iTodoRepository.deleteAllTodosInUser();
      emit(TodoState.deleteAll(response: response.data ?? '-'));
    } catch (e) {
      emit(TodoState.failed(errorMessage: e.toString()));
    }
  }
}
