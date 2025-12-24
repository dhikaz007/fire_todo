// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInitialImpl implements _AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitial implements AuthState {
  const factory _AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLoadingImpl implements _AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _AuthLoading implements AuthState {
  const factory _AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedImplCopyWith(_$AuthAuthenticatedImpl value,
          $Res Function(_$AuthAuthenticatedImpl) then) =
      __$$AuthAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginModel response, String token});

  $LoginModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$AuthAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthAuthenticatedImpl>
    implements _$$AuthAuthenticatedImplCopyWith<$Res> {
  __$$AuthAuthenticatedImplCopyWithImpl(_$AuthAuthenticatedImpl _value,
      $Res Function(_$AuthAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? token = null,
  }) {
    return _then(_$AuthAuthenticatedImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginModel,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res> get response {
    return $LoginModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$AuthAuthenticatedImpl implements _AuthAuthenticated {
  const _$AuthAuthenticatedImpl(
      {this.response = const LoginModel(), this.token = ''});

  @override
  @JsonKey()
  final LoginModel response;
  @override
  @JsonKey()
  final String token;

  @override
  String toString() {
    return 'AuthState.authenticated(response: $response, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      __$$AuthAuthenticatedImplCopyWithImpl<_$AuthAuthenticatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return authenticated(response, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return authenticated?.call(response, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(response, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticated implements AuthState {
  const factory _AuthAuthenticated(
      {final LoginModel response,
      final String token}) = _$AuthAuthenticatedImpl;

  LoginModel get response;
  String get token;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedImplCopyWith<_$AuthAuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailedImplCopyWith<$Res> {
  factory _$$AuthFailedImplCopyWith(
          _$AuthFailedImpl value, $Res Function(_$AuthFailedImpl) then) =
      __$$AuthFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$AuthFailedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailedImpl>
    implements _$$AuthFailedImplCopyWith<$Res> {
  __$$AuthFailedImplCopyWithImpl(
      _$AuthFailedImpl _value, $Res Function(_$AuthFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$AuthFailedImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailedImpl implements _AuthFailed {
  const _$AuthFailedImpl({this.errorMessage = ''});

  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'AuthState.failed(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailedImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailedImplCopyWith<_$AuthFailedImpl> get copyWith =>
      __$$AuthFailedImplCopyWithImpl<_$AuthFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return failed(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return failed?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _AuthFailed implements AuthState {
  const factory _AuthFailed({final String errorMessage}) = _$AuthFailedImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$AuthFailedImplCopyWith<_$AuthFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthLogoutImplCopyWith<$Res> {
  factory _$$AuthLogoutImplCopyWith(
          _$AuthLogoutImpl value, $Res Function(_$AuthLogoutImpl) then) =
      __$$AuthLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLogoutImpl>
    implements _$$AuthLogoutImplCopyWith<$Res> {
  __$$AuthLogoutImplCopyWithImpl(
      _$AuthLogoutImpl _value, $Res Function(_$AuthLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthLogoutImpl implements _AuthLogout {
  const _$AuthLogoutImpl();

  @override
  String toString() {
    return 'AuthState.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _AuthLogout implements AuthState {
  const factory _AuthLogout() = _$AuthLogoutImpl;
}

/// @nodoc
abstract class _$$AuthSignUpImplCopyWith<$Res> {
  factory _$$AuthSignUpImplCopyWith(
          _$AuthSignUpImpl value, $Res Function(_$AuthSignUpImpl) then) =
      __$$AuthSignUpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SignUpModel response});

  $SignUpModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$AuthSignUpImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSignUpImpl>
    implements _$$AuthSignUpImplCopyWith<$Res> {
  __$$AuthSignUpImplCopyWithImpl(
      _$AuthSignUpImpl _value, $Res Function(_$AuthSignUpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$AuthSignUpImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as SignUpModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpModelCopyWith<$Res> get response {
    return $SignUpModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$AuthSignUpImpl implements _AuthSignUp {
  const _$AuthSignUpImpl({this.response = const SignUpModel()});

  @override
  @JsonKey()
  final SignUpModel response;

  @override
  String toString() {
    return 'AuthState.signUp(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      __$$AuthSignUpImplCopyWithImpl<_$AuthSignUpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return signUp(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return signUp?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _AuthSignUp implements AuthState {
  const factory _AuthSignUp({final SignUpModel response}) = _$AuthSignUpImpl;

  SignUpModel get response;
  @JsonKey(ignore: true)
  _$$AuthSignUpImplCopyWith<_$AuthSignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthVerifyEmailImplCopyWith<$Res> {
  factory _$$AuthVerifyEmailImplCopyWith(_$AuthVerifyEmailImpl value,
          $Res Function(_$AuthVerifyEmailImpl) then) =
      __$$AuthVerifyEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RequestEmailModel response});

  $RequestEmailModelCopyWith<$Res> get response;
}

/// @nodoc
class __$$AuthVerifyEmailImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthVerifyEmailImpl>
    implements _$$AuthVerifyEmailImplCopyWith<$Res> {
  __$$AuthVerifyEmailImplCopyWithImpl(
      _$AuthVerifyEmailImpl _value, $Res Function(_$AuthVerifyEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$AuthVerifyEmailImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as RequestEmailModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestEmailModelCopyWith<$Res> get response {
    return $RequestEmailModelCopyWith<$Res>(_value.response, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$AuthVerifyEmailImpl implements _AuthVerifyEmail {
  const _$AuthVerifyEmailImpl({this.response = const RequestEmailModel()});

  @override
  @JsonKey()
  final RequestEmailModel response;

  @override
  String toString() {
    return 'AuthState.verifyEmail(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthVerifyEmailImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthVerifyEmailImplCopyWith<_$AuthVerifyEmailImpl> get copyWith =>
      __$$AuthVerifyEmailImplCopyWithImpl<_$AuthVerifyEmailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(LoginModel response, String token) authenticated,
    required TResult Function(String errorMessage) failed,
    required TResult Function() logout,
    required TResult Function(SignUpModel response) signUp,
    required TResult Function(RequestEmailModel response) verifyEmail,
  }) {
    return verifyEmail(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(LoginModel response, String token)? authenticated,
    TResult? Function(String errorMessage)? failed,
    TResult? Function()? logout,
    TResult? Function(SignUpModel response)? signUp,
    TResult? Function(RequestEmailModel response)? verifyEmail,
  }) {
    return verifyEmail?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(LoginModel response, String token)? authenticated,
    TResult Function(String errorMessage)? failed,
    TResult Function()? logout,
    TResult Function(SignUpModel response)? signUp,
    TResult Function(RequestEmailModel response)? verifyEmail,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthLoading value) loading,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failed,
    required TResult Function(_AuthLogout value) logout,
    required TResult Function(_AuthSignUp value) signUp,
    required TResult Function(_AuthVerifyEmail value) verifyEmail,
  }) {
    return verifyEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthLoading value)? loading,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failed,
    TResult? Function(_AuthLogout value)? logout,
    TResult? Function(_AuthSignUp value)? signUp,
    TResult? Function(_AuthVerifyEmail value)? verifyEmail,
  }) {
    return verifyEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthLoading value)? loading,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failed,
    TResult Function(_AuthLogout value)? logout,
    TResult Function(_AuthSignUp value)? signUp,
    TResult Function(_AuthVerifyEmail value)? verifyEmail,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail(this);
    }
    return orElse();
  }
}

abstract class _AuthVerifyEmail implements AuthState {
  const factory _AuthVerifyEmail({final RequestEmailModel response}) =
      _$AuthVerifyEmailImpl;

  RequestEmailModel get response;
  @JsonKey(ignore: true)
  _$$AuthVerifyEmailImplCopyWith<_$AuthVerifyEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
