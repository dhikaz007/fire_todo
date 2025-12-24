part of 'services.dart';

abstract class AuthRepository {
  Future<ResponseAPI<LoginModel>> fetchLogin(String email, String password);
  Future<ResponseAPI<SignUpModel>> fetchSignUp(String email, String password);
  Future<ResponseAPI<RequestEmailModel>> fetchRequestEmailVerified();
  Future<void> fetchLogout();
}
