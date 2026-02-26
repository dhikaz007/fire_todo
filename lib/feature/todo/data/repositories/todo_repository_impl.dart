import 'package:dio/dio.dart';

import '../../../../extensions/extensions.dart';
import '../../../../shared/models/models.dart';
import '../../domain/models/list_todo_model.dart';
import '../../domain/repositories/i_todo_repository.dart';
import '../datasources/todo_remote_datasources.dart';

class TodoRepositoryImpl implements ITodoRepository {
  final TodoRemoteDatasources _todoRemoteDatasources;

  TodoRepositoryImpl({required TodoRemoteDatasources todoRemoteDatasources})
      : _todoRemoteDatasources = todoRemoteDatasources;

  @override
  Future<ResponseAPI<String>> deleteAllTodosInUser() async {
    try {
      final getListResponse = await _todoRemoteDatasources.getAllTodo();
      if (getListResponse.statusCode != 200) {
        final error =
            ErrorResponseModel.fromJson(Map.from(getListResponse.data));
        throw ResponseAPI.fromValue(error);
      }

      final listTodoModel =
          ListTodoModel.fromJson(Map.from(getListResponse.data));

      if (listTodoModel.documents == null || listTodoModel.documents!.isEmpty) {
        return ResponseAPI.fromValue('Tidak ada dokumen todo untuk dihapus.');
      }

      final List<Map<String, dynamic>> writes =
          listTodoModel.documents!.map((doc) {
        return {"delete": doc.name};
      }).toList();

      final batchResponse = await _todoRemoteDatasources.deleteAll(writes);

      if (batchResponse.statusCode == 200) {
        return ResponseAPI.fromValue('Semua todo berhasil dihapus.');
      }

      final error = ErrorResponseModel.fromJson(Map.from(batchResponse.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<dynamic> deleteTodo(String id) async {
    try {
      final response = await _todoRemoteDatasources.deleteTodo(id);
      if (response.statusCode == 200) {
        return ResponseAPI.fromValue(
            response.statusMessage ?? 'Todo berhasil dihapus.');
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<ListTodoModel>> fetchListTodo() async {
    try {
      final response = await _todoRemoteDatasources.getAllTodo();
      if (response.statusCode == 200) {
        final datas = ListTodoModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(datas);
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> fetchTodoDetail(String id) async {
    try {
      final response = await _todoRemoteDatasources.getDetail(id);
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> patchTodo(
    String id,
    String title,
    String description,
    bool? isDone,
    DateTime? dueDate,
  ) async {
    try {
      final Map<String, dynamic> individualParams = {};

      if (title.isNotEmpty) individualParams['title'] = {"stringValue": title};
      if (description.isNotEmpty) {
        individualParams['description'] = {"stringValue": description};
      }
      if (dueDate != null) {
        individualParams['dueDate'] = {
          "timestampValue": dueDate.toUtc().toIso8601String()
        };
      }
      if (isDone != null) individualParams['isDone'] = {"booleanValue": isDone};

      final response = await _todoRemoteDatasources.editTodo(
        id: id,
        body: {"fields": individualParams},
        queryParameters: {
          "updateMask.fieldPaths": individualParams.keys.toList()
        },
      );
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> postTodo(
    String? title,
    String? description,
    DateTime? createdAt,
    bool? isDone,
  ) async {
    try {
      final fields = FieldsModel(
        title: DescriptionValueModel(stringValue: title),
        description: DescriptionValueModel(stringValue: description),
        dueDate: DueDateValueModel(timestampValue: createdAt),
        isDone: IsDoneValueModel(booleanValue: isDone),
      );

      final response =
          await _todoRemoteDatasources.createTodo({"fields": fields});
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }
}
