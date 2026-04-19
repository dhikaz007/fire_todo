// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial() when initial != null:
        return initial(_that);
      case _AuthLoading() when loading != null:
        return loading(_that);
      case _AuthAuthenticated() when authenticated != null:
        return authenticated(_that);
      case _AuthFailed() when failed != null:
        return failed(_that);
      case _AuthLogout() when logout != null:
        return logout(_that);
      case _AuthSignUp() when signUp != null:
        return signUp(_that);
      case _AuthVerifyEmail() when verifyEmail != null:
        return verifyEmail(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial():
        return initial(_that);
      case _AuthLoading():
        return loading(_that);
      case _AuthAuthenticated():
        return authenticated(_that);
      case _AuthFailed():
        return failed(_that);
      case _AuthLogout():
        return logout(_that);
      case _AuthSignUp():
        return signUp(_that);
      case _AuthVerifyEmail():
        return verifyEmail(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial() when initial != null:
        return initial(_that);
      case _AuthLoading() when loading != null:
        return loading(_that);
      case _AuthAuthenticated() when authenticated != null:
        return authenticated(_that);
      case _AuthFailed() when failed != null:
        return failed(_that);
      case _AuthLogout() when logout != null:
        return logout(_that);
      case _AuthSignUp() when signUp != null:
        return signUp(_that);
      case _AuthVerifyEmail() when verifyEmail != null:
        return verifyEmail(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial() when initial != null:
        return initial();
      case _AuthLoading() when loading != null:
        return loading();
      case _AuthAuthenticated() when authenticated != null:
        return authenticated(_that.response, _that.token);
      case _AuthFailed() when failed != null:
        return failed(_that.errorMessage);
      case _AuthLogout() when logout != null:
        return logout();
      case _AuthSignUp() when signUp != null:
        return signUp(_that.response);
      case _AuthVerifyEmail() when verifyEmail != null:
        return verifyEmail(_that.response);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial():
        return initial();
      case _AuthLoading():
        return loading();
      case _AuthAuthenticated():
        return authenticated(_that.response, _that.token);
      case _AuthFailed():
        return failed(_that.errorMessage);
      case _AuthLogout():
        return logout();
      case _AuthSignUp():
        return signUp(_that.response);
      case _AuthVerifyEmail():
        return verifyEmail(_that.response);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

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
    final _that = this;
    switch (_that) {
      case _AuthInitial() when initial != null:
        return initial();
      case _AuthLoading() when loading != null:
        return loading();
      case _AuthAuthenticated() when authenticated != null:
        return authenticated(_that.response, _that.token);
      case _AuthFailed() when failed != null:
        return failed(_that.errorMessage);
      case _AuthLogout() when logout != null:
        return logout();
      case _AuthSignUp() when signUp != null:
        return signUp(_that.response);
      case _AuthVerifyEmail() when verifyEmail != null:
        return verifyEmail(_that.response);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthInitial implements AuthState {
  const _AuthInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class _AuthLoading implements AuthState {
  const _AuthLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class _AuthAuthenticated implements AuthState {
  const _AuthAuthenticated(
      {this.response = const LoginModel(), this.token = ''});

  @JsonKey()
  final LoginModel response;
  @JsonKey()
  final String token;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthAuthenticatedCopyWith<_AuthAuthenticated> get copyWith =>
      __$AuthAuthenticatedCopyWithImpl<_AuthAuthenticated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthAuthenticated &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, token);

  @override
  String toString() {
    return 'AuthState.authenticated(response: $response, token: $token)';
  }
}

/// @nodoc
abstract mixin class _$AuthAuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthAuthenticatedCopyWith(
          _AuthAuthenticated value, $Res Function(_AuthAuthenticated) _then) =
      __$AuthAuthenticatedCopyWithImpl;
  @useResult
  $Res call({LoginModel response, String token});

  $LoginModelCopyWith<$Res> get response;
}

/// @nodoc
class __$AuthAuthenticatedCopyWithImpl<$Res>
    implements _$AuthAuthenticatedCopyWith<$Res> {
  __$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final _AuthAuthenticated _self;
  final $Res Function(_AuthAuthenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
    Object? token = null,
  }) {
    return _then(_AuthAuthenticated(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginModel,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<$Res> get response {
    return $LoginModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _AuthFailed implements AuthState {
  const _AuthFailed({this.errorMessage = ''});

  @JsonKey()
  final String errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthFailedCopyWith<_AuthFailed> get copyWith =>
      __$AuthFailedCopyWithImpl<_AuthFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthFailed &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'AuthState.failed(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$AuthFailedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthFailedCopyWith(
          _AuthFailed value, $Res Function(_AuthFailed) _then) =
      __$AuthFailedCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$AuthFailedCopyWithImpl<$Res> implements _$AuthFailedCopyWith<$Res> {
  __$AuthFailedCopyWithImpl(this._self, this._then);

  final _AuthFailed _self;
  final $Res Function(_AuthFailed) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_AuthFailed(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AuthLogout implements AuthState {
  const _AuthLogout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AuthLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.logout()';
  }
}

/// @nodoc

class _AuthSignUp implements AuthState {
  const _AuthSignUp({this.response = const SignUpModel()});

  @JsonKey()
  final SignUpModel response;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthSignUpCopyWith<_AuthSignUp> get copyWith =>
      __$AuthSignUpCopyWithImpl<_AuthSignUp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthSignUp &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'AuthState.signUp(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$AuthSignUpCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthSignUpCopyWith(
          _AuthSignUp value, $Res Function(_AuthSignUp) _then) =
      __$AuthSignUpCopyWithImpl;
  @useResult
  $Res call({SignUpModel response});

  $SignUpModelCopyWith<$Res> get response;
}

/// @nodoc
class __$AuthSignUpCopyWithImpl<$Res> implements _$AuthSignUpCopyWith<$Res> {
  __$AuthSignUpCopyWithImpl(this._self, this._then);

  final _AuthSignUp _self;
  final $Res Function(_AuthSignUp) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_AuthSignUp(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as SignUpModel,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignUpModelCopyWith<$Res> get response {
    return $SignUpModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _AuthVerifyEmail implements AuthState {
  const _AuthVerifyEmail({this.response = const RequestEmailModel()});

  @JsonKey()
  final RequestEmailModel response;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthVerifyEmailCopyWith<_AuthVerifyEmail> get copyWith =>
      __$AuthVerifyEmailCopyWithImpl<_AuthVerifyEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthVerifyEmail &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'AuthState.verifyEmail(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$AuthVerifyEmailCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$AuthVerifyEmailCopyWith(
          _AuthVerifyEmail value, $Res Function(_AuthVerifyEmail) _then) =
      __$AuthVerifyEmailCopyWithImpl;
  @useResult
  $Res call({RequestEmailModel response});

  $RequestEmailModelCopyWith<$Res> get response;
}

/// @nodoc
class __$AuthVerifyEmailCopyWithImpl<$Res>
    implements _$AuthVerifyEmailCopyWith<$Res> {
  __$AuthVerifyEmailCopyWithImpl(this._self, this._then);

  final _AuthVerifyEmail _self;
  final $Res Function(_AuthVerifyEmail) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_AuthVerifyEmail(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as RequestEmailModel,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequestEmailModelCopyWith<$Res> get response {
    return $RequestEmailModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

// dart format on
