part of 'services.dart';

abstract class TodoRepository {
  Future<ResponseAPI<ListTodoModel>> fetchListTodo();
  Future<ResponseAPI<DocumentModel>> postTodo(
    String? title,
    String? description,
    DateTime? createdAt,
    bool? isDone,
  );
  Future<ResponseAPI<DocumentModel>> patchTodo(
    String id,
    String title,
    String description,
    bool? isDone,
    DateTime? dueDate,
  );
  Future<dynamic> deleteTodo(String id);
  Future<ResponseAPI<DocumentModel>> fetchTodoDetail(String id);
  Future<ResponseAPI<String>> deleteAllTodosInUser();
}
