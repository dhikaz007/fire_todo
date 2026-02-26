import '../../../../shared/models/response_api.dart';
import '../models/login_model.dart';
import '../models/request_email_model.dart';
import '../models/sign_up_model.dart';

abstract class IAuthRepository {
  Future<ResponseAPI<LoginModel>> fetchLogin(String email, String password);
  Future<ResponseAPI<SignUpModel>> fetchSignUp(String email, String password);
  Future<ResponseAPI<RequestEmailModel>> fetchRequestEmailVerified();
  Future<void> fetchLogout();
}
