import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/user_local/domain/i_hive_repository.dart';
import '../../../../core/user_local/domain/models/profile_hive.dart';

import '../../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../../../auth/domain/models/models.dart';
import '../../domain/models/models.dart';
import '../../domain/repositories/i_profile_repository.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IProfileRepository _iProfileRepository;
  final IHiveRepository _iHiveRepository;
  final IStorageTokenRepository _iStorageTokenRepository;
  ProfileCubit({
    required IProfileRepository iProfileRepository,
    required IHiveRepository iHiveRepository,
    required IStorageTokenRepository iStorageTokenRepository,
  })  : _iProfileRepository = iProfileRepository,
        _iHiveRepository = iHiveRepository,
        _iStorageTokenRepository = iStorageTokenRepository,
        super(const ProfileState.initial());

  void getUser() async {
    try {
      emit(const ProfileState.loading());

      final response = await _iProfileRepository.fetchUser();
      var user = response.data?.users?.firstOrNull;

      if (user != null) {
        var box = _iHiveRepository.getProfile();

        const userKey = 'current_user';

        var profile = ProfileHive()
          ..localId = user.localId ?? ''
          ..email = user.email ?? ''
          ..displayName = user.displayName ?? ''
          ..passwordHash = user.passwordHash ?? ''
          ..emailVerified = user.emailVerified ?? false;

        await box.put(userKey, profile);
      }

      emit(ProfileState.loaded(response: response.data ?? const UserModel()));
    } catch (e) {
      emit(ProfileState.failed(errorMessage: e.toString()));
    }
  }

  void deleteAccount() async {
    try {
      emit(const ProfileState.loading());

      final response = await _iProfileRepository.fetchDeleteAccount();
      await _iStorageTokenRepository.removeAllToken();
      _iHiveRepository.deleteProfile();
      emit(ProfileState.delete(
          response: response.data ?? const DeleteAccountModel()));
    } catch (e) {
      emit(ProfileState.failed(errorMessage: e.toString()));
    }
  }

  void resetPassword({required String email}) async {
    try {
      emit(const ProfileState.loading());

      final response = await _iProfileRepository.fetchResetPassword(email);
      emit(ProfileState.reset(
          response: response.data ?? const RequestEmailModel()));
    } catch (e) {
      emit(ProfileState.failed(errorMessage: e.toString()));
    }
  }
}
