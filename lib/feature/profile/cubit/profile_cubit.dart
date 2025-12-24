import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../hive/boxes.dart';
import '../../../hive/profile_hive.dart';
import '../../../storage/storage.dart';
import '../../auth/domain/models/models.dart';
import '../domain/models/models.dart';
import '../domain/services/services.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  final HiveRepository hiveRepository;
  final StorageTokenRepository storageTokenRepository;
  ProfileCubit({
    required this.profileRepository,
    required this.hiveRepository,
    required this.storageTokenRepository,
  }) : super(const ProfileState.initial());

  void getUser() async {
    try {
      emit(const ProfileState.loading());

      final response = await profileRepository.fetchUser();
      var user = response.data?.users?.firstOrNull;

      if (user != null) {
        var box = hiveRepository.getProfile();

        // Gunakan kunci unik, misalnya 'current_user'
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

      final response = await profileRepository.fetchDeleteAccount();
      await storageTokenRepository.removeAllToken();
      hiveRepository.deleteProfile();
      emit(ProfileState.delete(
          response: response.data ?? const DeleteAccountModel()));
    } catch (e) {
      emit(ProfileState.failed(errorMessage: e.toString()));
    }
  }

  void resetPassword({required String email}) async {
    try {
      emit(const ProfileState.loading());

      final response = await profileRepository.fetchResetPassword(email);
      emit(ProfileState.reset(
          response: response.data ?? const RequestEmailModel()));
    } catch (e) {
      emit(ProfileState.failed(errorMessage: e.toString()));
    }
  }
}
