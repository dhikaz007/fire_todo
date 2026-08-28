import '../../../../core/models/models.dart';
import '../../../auth/domain/models/models.dart';
import '../models/models.dart';

abstract class IProfileRepository {
  Future<ResponseAPI<UserModel>> fetchUser();
  Future<ResponseAPI<DeleteAccountModel>> fetchDeleteAccount();
  Future<ResponseAPI<RequestEmailModel>> fetchResetPassword(String email);
}
