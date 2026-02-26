import 'package:dio/dio.dart';

import '../../../../extensions/extensions.dart';
import '../../../../shared/models/models.dart';
import '../../../../shared/storage/domain/i_storage_token_repository.dart';
import '../../../auth/domain/models/request_email_model.dart';
import '../../domain/models/delete_account_model.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/i_profile_repository.dart';
import '../datasources/profile_remote_datasources.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDatasources _profileRemoteDatasources;
  final IStorageTokenRepository _iStorageTokenRepository;

  ProfileRepositoryImpl(
      {required ProfileRemoteDatasources profileRemoteDatasources,
      required IStorageTokenRepository iStorageTokenRepository})
      : _profileRemoteDatasources = profileRemoteDatasources,
        _iStorageTokenRepository = iStorageTokenRepository;

  @override
  Future<ResponseAPI<DeleteAccountModel>> fetchDeleteAccount() async {
    try {
      final idToken = await _iStorageTokenRepository.getIdToken();
      final response =
          await _profileRemoteDatasources.deleteUser({"idToken": idToken});
      if (response.statusCode == 200) {
        final delete = DeleteAccountModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(delete);
      }
      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<RequestEmailModel>> fetchResetPassword(
      String email) async {
    try {
      final response = await _profileRemoteDatasources.resetPassword({
        "requestType": "PASSWORD_RESET",
        "email": email,
      });
      if (response.statusCode == 200) {
        final delete = RequestEmailModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(delete);
      }
      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<UserModel>> fetchUser() async {
    try {
      final idToken = await _iStorageTokenRepository.getIdToken();
      final response =
          await _profileRemoteDatasources.getUser({"idToken": idToken});
      if (response.statusCode == 200) {
        final delete = UserModel.fromJson(Map.from(response.data));
        return ResponseAPI.fromValue(delete);
      }
      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }
}
