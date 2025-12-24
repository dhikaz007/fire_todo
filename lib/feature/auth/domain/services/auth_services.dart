part of 'services.dart';

class AuthServices with BaseServices implements AuthRepository {
  final StorageTokenRepository storageTokenRepository;
  final HiveRepository hiveRepository;
  AuthServices({
    required this.storageTokenRepository,
    required this.hiveRepository,
  });

  @override
  Future<ResponseAPI<LoginModel>> fetchLogin(
    String email,
    String password,
  ) async {
    try {
      Dio http = await dio(ApiType.identity);

      Response response = await http.post(
        '/accounts:signInWithPassword',
        data: {"email": email, "password": password, "returnSecureToken": true},
      );

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
    String email,
    String password,
  ) async {
    try {
      Dio http = await dio(ApiType.identity);

      Response response = await http.post(
        '/accounts:signUp',
        data: {"email": email, "password": password, "returnSecureToken": true},
      );

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
      Dio http = await dio(ApiType.identity);

      final token = await storageTokenRepository.getIdToken();

      Response response = await http.post(
        '/accounts:sendOobCode',
        data: {"requestType": "VERIFY_EMAIL", "idToken": token},
      );

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
      await hiveRepository.deleteProfile();
      await storageTokenRepository.removeAllToken();
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }
}
