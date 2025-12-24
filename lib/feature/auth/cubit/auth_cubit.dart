import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../hive/boxes.dart';
import '../../../storage/storage.dart';
import '../domain/models/models.dart';
import '../domain/services/services.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final StorageTokenRepository storageRepository;
  final HiveRepository hiveRepository;
  AuthCubit({
    required this.authRepository,
    required this.storageRepository,
    required this.hiveRepository,
  }) : super(const AuthState.initial());

  void loginEmailPassword({
    required String email,
    required String password,
  }) async {
    state.maybeMap(
      loading: (_) => null,
      orElse: () async {
        try {
          emit(const AuthState.loading());
          final response = await authRepository.fetchLogin(email, password);
          final idToken = response.data?.idToken ?? '';

          await storageRepository.setIdToken(idToken);
          await storageRepository.setRefreshToken(
            response.data?.refreshToken ?? '',
          );

          emit(
            AuthState.authenticated(
                response: response.data ?? const LoginModel(), token: idToken),
          );
        } catch (e) {
          emit(AuthState.failed(errorMessage: e.toString()));
        }
      },
    );
  }

  void logout() async {
    state.maybeMap(
      loading: (_) => null,
      orElse: () async {
        try {
          emit(const AuthState.loading());
          await authRepository.fetchLogout();
          await Future.delayed(const Duration(seconds: 2));
          emit(const AuthState.logout());
        } catch (e) {
          emit(AuthState.failed(errorMessage: e.toString()));
        }
      },
    );
  }

  void signUp({required String email, required String password}) async {
    state.maybeMap(
      loading: (_) => null,
      orElse: () async {
        try {
          emit(const AuthState.loading());

          final response = await authRepository.fetchSignUp(email, password);
          await storageRepository.setIdToken(response.data?.idToken ?? '');
          await storageRepository.setRefreshToken(
            response.data?.refreshToken ?? '',
          );

          emit(
              AuthState.signUp(response: response.data ?? const SignUpModel()));
        } catch (e) {
          emit(AuthState.failed(errorMessage: e.toString()));
        }
      },
    );
  }

  void verifyEmail() async {
    state.maybeMap(
      loading: (_) => null,
      orElse: () async {
        try {
          emit(const AuthState.loading());

          final response = await authRepository.fetchRequestEmailVerified();
          await storageRepository.removeAllToken();
          await hiveRepository.deleteProfile();

          emit(
            AuthState.verifyEmail(
                response: response.data ?? const RequestEmailModel()),
          );
        } catch (e) {
          emit(AuthState.failed(errorMessage: e.toString()));
        }
      },
    );
  }
}
