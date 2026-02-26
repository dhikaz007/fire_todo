import 'package:dio/dio.dart';

class AuthRemoteDatasource {
  final Dio _dio;
  AuthRemoteDatasource({required Dio dio}) : _dio = dio;

  Future<Response> login(String email, String password) async {
    return await _dio.post(
      '/accounts:signInWithPassword',
      data: {"email": email, "password": password, "returnSecureToken": true},
    );
  }

  Future<Response> signUp(String email, String password) async {
    return await _dio.post(
      '/accounts:signUp',
      data: {"email": email, "password": password, "returnSecureToken": true},
    );
  }

  Future<Response> sendEmailVerification(String? token) async {
    return await _dio.post(
      '/accounts:sendOobCode',
      data: {"requestType": "VERIFY_EMAIL", "idToken": token},
    );
  }
}
