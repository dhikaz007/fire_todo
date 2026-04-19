// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpModel {
  String? get kind;
  String? get idToken;
  String? get email;
  String? get refreshToken;
  String? get expiresIn;
  String? get localId;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpModelCopyWith<SignUpModel> get copyWith =>
      _$SignUpModelCopyWithImpl<SignUpModel>(this as SignUpModel, _$identity);

  /// Serializes this SignUpModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, idToken, email, refreshToken, expiresIn, localId);

  @override
  String toString() {
    return 'SignUpModel(kind: $kind, idToken: $idToken, email: $email, refreshToken: $refreshToken, expiresIn: $expiresIn, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(
          SignUpModel value, $Res Function(SignUpModel) _then) =
      _$SignUpModelCopyWithImpl;
  @useResult
  $Res call(
      {String? kind,
      String? idToken,
      String? email,
      String? refreshToken,
      String? expiresIn,
      String? localId});
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res> implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._self, this._then);

  final SignUpModel _self;
  final $Res Function(SignUpModel) _then;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? localId = freezed,
  }) {
    return _then(_self.copyWith(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SignUpModel].
extension SignUpModelPatterns on SignUpModel {
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
    TResult Function(_SignUpModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignUpModel() when $default != null:
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
    TResult Function(_SignUpModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpModel():
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
    TResult? Function(_SignUpModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpModel() when $default != null:
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
    TResult Function(String? kind, String? idToken, String? email,
            String? refreshToken, String? expiresIn, String? localId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignUpModel() when $default != null:
        return $default(_that.kind, _that.idToken, _that.email,
            _that.refreshToken, _that.expiresIn, _that.localId);
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
    TResult Function(String? kind, String? idToken, String? email,
            String? refreshToken, String? expiresIn, String? localId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpModel():
        return $default(_that.kind, _that.idToken, _that.email,
            _that.refreshToken, _that.expiresIn, _that.localId);
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
    TResult? Function(String? kind, String? idToken, String? email,
            String? refreshToken, String? expiresIn, String? localId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignUpModel() when $default != null:
        return $default(_that.kind, _that.idToken, _that.email,
            _that.refreshToken, _that.expiresIn, _that.localId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SignUpModel implements SignUpModel {
  const _SignUpModel(
      {this.kind,
      this.idToken,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId});
  factory _SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  @override
  final String? kind;
  @override
  final String? idToken;
  @override
  final String? email;
  @override
  final String? refreshToken;
  @override
  final String? expiresIn;
  @override
  final String? localId;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpModelCopyWith<_SignUpModel> get copyWith =>
      __$SignUpModelCopyWithImpl<_SignUpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SignUpModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.localId, localId) || other.localId == localId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, idToken, email, refreshToken, expiresIn, localId);

  @override
  String toString() {
    return 'SignUpModel(kind: $kind, idToken: $idToken, email: $email, refreshToken: $refreshToken, expiresIn: $expiresIn, localId: $localId)';
  }
}

/// @nodoc
abstract mixin class _$SignUpModelCopyWith<$Res>
    implements $SignUpModelCopyWith<$Res> {
  factory _$SignUpModelCopyWith(
          _SignUpModel value, $Res Function(_SignUpModel) _then) =
      __$SignUpModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? kind,
      String? idToken,
      String? email,
      String? refreshToken,
      String? expiresIn,
      String? localId});
}

/// @nodoc
class __$SignUpModelCopyWithImpl<$Res> implements _$SignUpModelCopyWith<$Res> {
  __$SignUpModelCopyWithImpl(this._self, this._then);

  final _SignUpModel _self;
  final $Res Function(_SignUpModel) _then;

  /// Create a copy of SignUpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? refreshToken = freezed,
    Object? expiresIn = freezed,
    Object? localId = freezed,
  }) {
    return _then(_SignUpModel(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _self.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _self.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      localId: freezed == localId
          ? _self.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
