import 'package:dio/dio.dart';

import '../../../../core/extensions/dio_err.dart';
import '../../../../core/user_local/domain/i_hive_repository.dart';
import '../../../../core/models/error_response_model.dart';
import '../../../../core/models/response_api.dart';
import '../../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDatasource _remoteDatasource;
  final IStorageTokenRepository _storageTokenRepository;
  final IHiveRepository _hiveRepository;

  AuthRepositoryImpl(
      {required AuthRemoteDatasource remoteDatasource,
      required IStorageTokenRepository storageTokenRepository,
      required IHiveRepository hiveRepository})
      : _remoteDatasource = remoteDatasource,
        _storageTokenRepository = storageTokenRepository,
        _hiveRepository = hiveRepository;

  @override
  Future<ResponseAPI<LoginModel>> fetchLogin(
      String email, String password) async {
    try {
      final response = await _remoteDatasource.login(email, password);
      final data = response.data;

      if (response.statusCode == 200) {
        final login = LoginModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(login);
      }
      throw ResponseAPI<ErrorResponseModel>.fromValue(data);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<SignUpModel>> fetchSignUp(
      String email, String password) async {
    try {
      final response = await _remoteDatasource.signUp(email, password);
      final data = response.data;

      if (response.statusCode == 200) {
        final signUp = SignUpModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(signUp);
      }
      throw response.statusMessage.toString();
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<RequestEmailModel>> fetchRequestEmailVerified() async {
    try {
      final token = await _storageTokenRepository.getIdToken();
      final response = await _remoteDatasource.sendEmailVerification(token);
      final data = response.data;

      if (response.statusCode == 200) {
        final email = RequestEmailModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(email);
      }
      throw response.statusMessage.toString();
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<void> fetchLogout() async {
    try {
      // Logika logout murni urusan local storage
      await _hiveRepository.deleteProfile();
      await _storageTokenRepository.removeAllToken();
    } catch (e) {
      throw Exception("Logout failed: $e");
    }
  }
}
