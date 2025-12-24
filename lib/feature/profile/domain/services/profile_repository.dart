part of 'services.dart';

abstract class ProfileRepository {
  Future<ResponseAPI<UserModel>> fetchUser();
  Future<ResponseAPI<DeleteAccountModel>> fetchDeleteAccount();
  Future<ResponseAPI<RequestEmailModel>> fetchResetPassword(String email);
}
