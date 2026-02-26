import 'package:dio/dio.dart';

class ProfileRemoteDatasources {
  final Dio _dio;

  ProfileRemoteDatasources({required Dio dio}) : _dio = dio;

  Future<Response> getUser(Map<String, dynamic> data) async {
    return await _dio.post('/accounts:lookup', data: data);
  }

  Future<Response> deleteUser(Map<String, dynamic> data) async {
    return await _dio.post('/accounts:delete', data: data);
  }

  Future<Response> resetPassword(Map<String, dynamic> data) async {
    return await _dio.post('/accounts:sendOobCode', data: data);
  }
}
