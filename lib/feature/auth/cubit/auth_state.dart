part of 'auth_cubit.dart';

@Freezed()
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.authenticated({
    @Default(LoginModel()) LoginModel response,
    @Default('') String token,
  }) = _AuthAuthenticated;
  const factory AuthState.failed({@Default('') String errorMessage}) =
      _AuthFailed;
  const factory AuthState.logout() = _AuthLogout;
  const factory AuthState.signUp({
    @Default(SignUpModel()) SignUpModel response,
  }) = _AuthSignUp;
  const factory AuthState.verifyEmail({
    @Default(RequestEmailModel()) RequestEmailModel response,
  }) = _AuthVerifyEmail;
}
