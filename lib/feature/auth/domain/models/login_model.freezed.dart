// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginModel {
  String? get kind;
  String? get localId;
  String? get email;
  String? get displayName;
  String? get idToken;
  bool? get registered;
  String? get refreshToken;
  String? get expiresIn;

  /// Create a copy of LoginModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginModelCopyWith<LoginModel> get copyWith =>
      _$LoginModelCopyWithImpl<LoginModel>(this as LoginModel, _$identity);

  /// Serializes this LoginModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.registered, registered) ||
                other.registered == registered) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kind, localId, email,
      displayName, idToken, registered, refreshToken, expiresIn);

  @override
  String toString() {
    return 'LoginModel(kind: $kind, localId: $localId, email: $email, displayName: $displayName, idToken: $idToken, registered: $registered, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }
}

/// @nodoc
abstract mixin class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) _then) =
      _$LoginModelCopyWithImpl;
  @useResult
  $Res call(
      {String? kind,
      String? localId,
      String? email,
      String? displayName,
      String? idToken,
      bool? registered,
      String? refreshToken,
      String? expiresIn});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res> implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._self, this._then);

  final LoginModel _self;
  final $Res Function(LoginModel) _then;

  /// Create a copy of LoginModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? localId = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? idToken = freezed,
    Object? registered = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_self.copyWith(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      registered: freezed == registered
          ? _self.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as bool?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoginModel].
extension LoginModelPatterns on LoginModel {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginModel() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_LoginModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginModel():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LoginModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginModel() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? kind,
            String? localId,
            String? email,
            String? displayName,
            String? idToken,
            bool? registered,
            String? refreshToken,
            String? expiresIn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoginModel() when $default != null:
        return $default(
            _that.kind,
            _that.localId,
            _that.email,
            _that.displayName,
            _that.idToken,
            _that.registered,
            _that.refreshToken,
            _that.expiresIn);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            String? kind,
            String? localId,
            String? email,
            String? displayName,
            String? idToken,
            bool? registered,
            String? refreshToken,
            String? expiresIn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginModel():
        return $default(
            _that.kind,
            _that.localId,
            _that.email,
            _that.displayName,
            _that.idToken,
            _that.registered,
            _that.refreshToken,
            _that.expiresIn);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? kind,
            String? localId,
            String? email,
            String? displayName,
            String? idToken,
            bool? registered,
            String? refreshToken,
            String? expiresIn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoginModel() when $default != null:
        return $default(
            _that.kind,
            _that.localId,
            _that.email,
            _that.displayName,
            _that.idToken,
            _that.registered,
            _that.refreshToken,
            _that.expiresIn);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoginModel implements LoginModel {
  const _LoginModel(
      {this.kind,
      this.localId,
      this.email,
      this.displayName,
      this.idToken,
      this.registered,
      this.refreshToken,
      this.expiresIn});
  factory _LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  final String? kind;
  @override
  final String? localId;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? idToken;
  @override
  final bool? registered;
  @override
  final String? refreshToken;
  @override
  final String? expiresIn;

  /// Create a copy of LoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginModelCopyWith<_LoginModel> get copyWith =>
      __$LoginModelCopyWithImpl<_LoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.registered, registered) ||
                other.registered == registered) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, kind, localId, email,
      displayName, idToken, registered, refreshToken, expiresIn);

  @override
  String toString() {
    return 'LoginModel(kind: $kind, localId: $localId, email: $email, displayName: $displayName, idToken: $idToken, registered: $registered, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }
}

/// @nodoc
abstract mixin class _$LoginModelCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$LoginModelCopyWith(
          _LoginModel value, $Res Function(_LoginModel) _then) =
      __$LoginModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? kind,
      String? localId,
      String? email,
      String? displayName,
      String? idToken,
      bool? registered,
      String? refreshToken,
      String? expiresIn});
}

/// @nodoc
class __$LoginModelCopyWithImpl<$Res> implements _$LoginModelCopyWith<$Res> {
  __$LoginModelCopyWithImpl(this._self, this._then);

  final _LoginModel _self;
  final $Res Function(_LoginModel) _then;

  /// Create a copy of LoginModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = freezed,
    Object? localId = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? idToken = freezed,
    Object? registered = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_LoginModel(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      registered: freezed == registered
          ? _self.registered
          : registered // ignore: cast_nullable_to_non_nullable
              as bool?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
