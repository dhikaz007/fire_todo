import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/logging/app_logger.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/user_local/domain/i_hive_repository.dart';
import '../../../../core/token_storage/domain/i_storage_token_repository.dart';
import '../../domain/models/login_model.dart';
import '../../domain/models/request_email_model.dart';
import '../../domain/models/sign_up_model.dart';
import '../../domain/repositories/i_auth_repository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _iAuthRepository;
  final IStorageTokenRepository _iStorageTokenRepository;
  final IHiveRepository _iHiveRepository;
  AuthCubit({
    required IAuthRepository iAuthRepository,
    required IStorageTokenRepository iStorageTokenRepository,
    required IHiveRepository iHiveRepository,
  })  : _iAuthRepository = iAuthRepository,
        _iStorageTokenRepository = iStorageTokenRepository,
        _iHiveRepository = iHiveRepository,
        super(const AuthState.initial());

  bool get _isLoading => state is _AuthLoading;

  void loginEmailPassword({
    required String email,
    required String password,
  }) async {
    if (_isLoading) return;

    try {
      emit(const AuthState.loading());
      final response = await _iAuthRepository.fetchLogin(email, password);
      final idToken = response.data?.idToken ?? '';

      await _iStorageTokenRepository.setIdToken(idToken);
      await _iStorageTokenRepository.setRefreshToken(
        response.data?.refreshToken ?? '',
      );

      // Save FCM token to Firestore after login
      try {
        final fcmService = inject<FcmService>();
        await fcmService.saveTokenToFirestore();
      } catch (e) {
        // FCM token save failed, but login still succeeds
        AppLogger().w('Failed to save FCM token: $e');
      }

      emit(
        AuthState.authenticated(
            response: response.data ?? const LoginModel(), token: idToken),
      );
    } catch (e) {
      emit(AuthState.failed(errorMessage: e.toString()));
    }
  }

  void logout() async {
    if (_isLoading) return;
    try {
      emit(const AuthState.loading());
      await _iAuthRepository.fetchLogout();
      await Future.delayed(const Duration(seconds: 2));
      emit(const AuthState.logout());
    } catch (e) {
      emit(AuthState.failed(errorMessage: e.toString()));
    }
  }

  void signUp({required String email, required String password}) async {
    if (_isLoading) return;
    try {
      emit(const AuthState.loading());

      final response = await _iAuthRepository.fetchSignUp(email, password);
      await _iStorageTokenRepository.setIdToken(response.data?.idToken ?? '');
      await _iStorageTokenRepository.setRefreshToken(
        response.data?.refreshToken ?? '',
      );

      emit(AuthState.signUp(response: response.data ?? const SignUpModel()));
    } catch (e) {
      emit(AuthState.failed(errorMessage: e.toString()));
    }
  }

  void verifyEmail() async {
    if (_isLoading) return;
    try {
      emit(const AuthState.loading());

      final response = await _iAuthRepository.fetchRequestEmailVerified();
      await _iStorageTokenRepository.removeAllToken();
      await _iHiveRepository.deleteProfile();

      emit(
        AuthState.verifyEmail(
            response: response.data ?? const RequestEmailModel()),
      );
    } catch (e) {
      emit(AuthState.failed(errorMessage: e.toString()));
    }
  }
}
