part of 'services.dart';

class ProfileServices with BaseServices implements ProfileRepository {
  final StorageTokenRepository storageTokenRepository;
  ProfileServices({required this.storageTokenRepository});

  @override
  Future<ResponseAPI<UserModel>> fetchUser() async {
    try {
      Dio http = await dio(ApiType.identity);

      final idToken = await storageTokenRepository.getIdToken();

      Response response = await http.post(
        '/accounts:lookup',
        data: {"idToken": idToken},
      );

      final data = response.data;
      if (response.statusCode == 200) {
        final user = UserModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(user);
      } else {
        final error = ErrorResponseModel.fromJson(Map.from(data));
        throw ResponseAPI.fromValue(error);
      }
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DeleteAccountModel>> fetchDeleteAccount() async {
    try {
      Dio http = await dio(ApiType.identity);

      final idToken = await storageTokenRepository.getIdToken();

      Response response = await http.post(
        '/accounts:delete',
        data: {"idToken": idToken},
      );

      final data = response.data;
      if (response.statusCode == 200) {
        final delete = DeleteAccountModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(delete);
      }
      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<RequestEmailModel>> fetchResetPassword(
    String email,
  ) async {
    try {
      Dio http = await dio(ApiType.identity);

      Response response = await http.post(
        '/accounts:sendOobCode',
        data: {"requestType": 'PASSWORD_RESET', "email": email},
      );

      final data = response.data;
      if (response.statusCode == 200) {
        final reset = RequestEmailModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(reset);
      }
      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }
}
