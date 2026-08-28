import 'package:dio/dio.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/user_local/domain/i_hive_repository.dart';

class TodoRemoteDatasources {
  final Dio _dio;
  final IHiveRepository _iHiveRepository;
  TodoRemoteDatasources(
      {required Dio dio, required IHiveRepository iHiveRepository})
      : _dio = dio,
        _iHiveRepository = iHiveRepository;

  final String _baseUrl = UrlApp.collectionUrl;

  String _buildTodoPath([String? docId]) {
    final user = _iHiveRepository.getProfileValue();
    if (user?.localId == null) {
      throw Exception('User tidak ditemukan, tidak dapat mengakses data.');
    }
    final basePath = '$_baseUrl/${user!.localId}/todos';
    return docId != null ? '$basePath/$docId' : basePath;
  }

  Future<Response> getAllTodo() async {
    return await _dio.get(_buildTodoPath());
  }

  Future<Response> createTodo(Map<String, dynamic> data) async {
    return await _dio.post(_buildTodoPath(), data: data);
  }

  Future<Response> editTodo({
    required String id,
    required Map<String, dynamic> body,
    required Map<String, dynamic> queryParameters,
  }) async {
    return await _dio.patch(
      _buildTodoPath(id),
      data: body,
      queryParameters: queryParameters,
    );
  }

  Future<Response> deleteTodo(String id) async {
    return await _dio.delete(_buildTodoPath(id));
  }

  Future<Response> getDetail(String id) async {
    return await _dio.get(_buildTodoPath(id));
  }

  Future<Response> deleteAll(List<Map<String, dynamic>> writes) async {
    return await _dio.post(
      '/${UrlApp.projectId}/databases/(default)/documents:commit',
      data: {"writes": writes},
    );
  }
}
