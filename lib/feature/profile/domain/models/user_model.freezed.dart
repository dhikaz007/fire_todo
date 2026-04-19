// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String? get kind;
  List<UserElementData>? get users;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other.users, users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(users));

  @override
  String toString() {
    return 'UserModel(kind: $kind, users: $users)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call({String? kind, List<UserElementData>? users});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? users = freezed,
  }) {
    return _then(_self.copyWith(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _self.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserElementData>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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
    TResult Function(_UserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(_UserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
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
    TResult? Function(_UserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
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
    TResult Function(String? kind, List<UserElementData>? users)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(_that.kind, _that.users);
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
    TResult Function(String? kind, List<UserElementData>? users) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel():
        return $default(_that.kind, _that.users);
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
    TResult? Function(String? kind, List<UserElementData>? users)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserModel() when $default != null:
        return $default(_that.kind, _that.users);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel({this.kind, final List<UserElementData>? users})
      : _users = users;
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String? kind;
  final List<UserElementData>? _users;
  @override
  List<UserElementData>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(_users));

  @override
  String toString() {
    return 'UserModel(kind: $kind, users: $users)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? kind, List<UserElementData>? users});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = freezed,
    Object? users = freezed,
  }) {
    return _then(_UserModel(
      kind: freezed == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserElementData>?,
    ));
  }
}

/// @nodoc
mixin _$UserElementData {
  String? get localId;
  String? get email;
  String? get displayName;
  String? get passwordHash;
  bool? get emailVerified;
  int? get passwordUpdatedAt;
  List<ProviderUserInfo>? get providerUserInfo;
  String? get validSince;
  bool? get disabled;
  String? get lastLoginAt;
  String? get createdAt;
  DateTime? get lastRefreshAt;

  /// Create a copy of UserElementData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserElementDataCopyWith<UserElementData> get copyWith =>
      _$UserElementDataCopyWithImpl<UserElementData>(
          this as UserElementData, _$identity);

  /// Serializes this UserElementData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserElementData &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.passwordUpdatedAt, passwordUpdatedAt) ||
                other.passwordUpdatedAt == passwordUpdatedAt) &&
            const DeepCollectionEquality()
                .equals(other.providerUserInfo, providerUserInfo) &&
            (identical(other.validSince, validSince) ||
                other.validSince == validSince) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastRefreshAt, lastRefreshAt) ||
                other.lastRefreshAt == lastRefreshAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      email,
      displayName,
      passwordHash,
      emailVerified,
      passwordUpdatedAt,
      const DeepCollectionEquality().hash(providerUserInfo),
      validSince,
      disabled,
      lastLoginAt,
      createdAt,
      lastRefreshAt);

  @override
  String toString() {
    return 'UserElementData(localId: $localId, email: $email, displayName: $displayName, passwordHash: $passwordHash, emailVerified: $emailVerified, passwordUpdatedAt: $passwordUpdatedAt, providerUserInfo: $providerUserInfo, validSince: $validSince, disabled: $disabled, lastLoginAt: $lastLoginAt, createdAt: $createdAt, lastRefreshAt: $lastRefreshAt)';
  }
}

/// @nodoc
abstract mixin class $UserElementDataCopyWith<$Res> {
  factory $UserElementDataCopyWith(
          UserElementData value, $Res Function(UserElementData) _then) =
      _$UserElementDataCopyWithImpl;
  @useResult
  $Res call(
      {String? localId,
      String? email,
      String? displayName,
      String? passwordHash,
      bool? emailVerified,
      int? passwordUpdatedAt,
      List<ProviderUserInfo>? providerUserInfo,
      String? validSince,
      bool? disabled,
      String? lastLoginAt,
      String? createdAt,
      DateTime? lastRefreshAt});
}

/// @nodoc
class _$UserElementDataCopyWithImpl<$Res>
    implements $UserElementDataCopyWith<$Res> {
  _$UserElementDataCopyWithImpl(this._self, this._then);

  final UserElementData _self;
  final $Res Function(UserElementData) _then;

  /// Create a copy of UserElementData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? passwordHash = freezed,
    Object? emailVerified = freezed,
    Object? passwordUpdatedAt = freezed,
    Object? providerUserInfo = freezed,
    Object? validSince = freezed,
    Object? disabled = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? lastRefreshAt = freezed,
  }) {
    return _then(_self.copyWith(
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
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordUpdatedAt: freezed == passwordUpdatedAt
          ? _self.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      providerUserInfo: freezed == providerUserInfo
          ? _self.providerUserInfo
          : providerUserInfo // ignore: cast_nullable_to_non_nullable
              as List<ProviderUserInfo>?,
      validSince: freezed == validSince
          ? _self.validSince
          : validSince // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRefreshAt: freezed == lastRefreshAt
          ? _self.lastRefreshAt
          : lastRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserElementData].
extension UserElementDataPatterns on UserElementData {
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
    TResult Function(_UserElementData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserElementData() when $default != null:
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
    TResult Function(_UserElementData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserElementData():
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
    TResult? Function(_UserElementData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserElementData() when $default != null:
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
            String? localId,
            String? email,
            String? displayName,
            String? passwordHash,
            bool? emailVerified,
            int? passwordUpdatedAt,
            List<ProviderUserInfo>? providerUserInfo,
            String? validSince,
            bool? disabled,
            String? lastLoginAt,
            String? createdAt,
            DateTime? lastRefreshAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserElementData() when $default != null:
        return $default(
            _that.localId,
            _that.email,
            _that.displayName,
            _that.passwordHash,
            _that.emailVerified,
            _that.passwordUpdatedAt,
            _that.providerUserInfo,
            _that.validSince,
            _that.disabled,
            _that.lastLoginAt,
            _that.createdAt,
            _that.lastRefreshAt);
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
            String? localId,
            String? email,
            String? displayName,
            String? passwordHash,
            bool? emailVerified,
            int? passwordUpdatedAt,
            List<ProviderUserInfo>? providerUserInfo,
            String? validSince,
            bool? disabled,
            String? lastLoginAt,
            String? createdAt,
            DateTime? lastRefreshAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserElementData():
        return $default(
            _that.localId,
            _that.email,
            _that.displayName,
            _that.passwordHash,
            _that.emailVerified,
            _that.passwordUpdatedAt,
            _that.providerUserInfo,
            _that.validSince,
            _that.disabled,
            _that.lastLoginAt,
            _that.createdAt,
            _that.lastRefreshAt);
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
            String? localId,
            String? email,
            String? displayName,
            String? passwordHash,
            bool? emailVerified,
            int? passwordUpdatedAt,
            List<ProviderUserInfo>? providerUserInfo,
            String? validSince,
            bool? disabled,
            String? lastLoginAt,
            String? createdAt,
            DateTime? lastRefreshAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserElementData() when $default != null:
        return $default(
            _that.localId,
            _that.email,
            _that.displayName,
            _that.passwordHash,
            _that.emailVerified,
            _that.passwordUpdatedAt,
            _that.providerUserInfo,
            _that.validSince,
            _that.disabled,
            _that.lastLoginAt,
            _that.createdAt,
            _that.lastRefreshAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserElementData implements UserElementData {
  const _UserElementData(
      {this.localId,
      this.email,
      this.displayName,
      this.passwordHash,
      this.emailVerified,
      this.passwordUpdatedAt,
      final List<ProviderUserInfo>? providerUserInfo,
      this.validSince,
      this.disabled,
      this.lastLoginAt,
      this.createdAt,
      this.lastRefreshAt})
      : _providerUserInfo = providerUserInfo;
  factory _UserElementData.fromJson(Map<String, dynamic> json) =>
      _$UserElementDataFromJson(json);

  @override
  final String? localId;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? passwordHash;
  @override
  final bool? emailVerified;
  @override
  final int? passwordUpdatedAt;
  final List<ProviderUserInfo>? _providerUserInfo;
  @override
  List<ProviderUserInfo>? get providerUserInfo {
    final value = _providerUserInfo;
    if (value == null) return null;
    if (_providerUserInfo is EqualUnmodifiableListView)
      return _providerUserInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? validSince;
  @override
  final bool? disabled;
  @override
  final String? lastLoginAt;
  @override
  final String? createdAt;
  @override
  final DateTime? lastRefreshAt;

  /// Create a copy of UserElementData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserElementDataCopyWith<_UserElementData> get copyWith =>
      __$UserElementDataCopyWithImpl<_UserElementData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserElementDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserElementData &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.passwordHash, passwordHash) ||
                other.passwordHash == passwordHash) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.passwordUpdatedAt, passwordUpdatedAt) ||
                other.passwordUpdatedAt == passwordUpdatedAt) &&
            const DeepCollectionEquality()
                .equals(other._providerUserInfo, _providerUserInfo) &&
            (identical(other.validSince, validSince) ||
                other.validSince == validSince) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastRefreshAt, lastRefreshAt) ||
                other.lastRefreshAt == lastRefreshAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localId,
      email,
      displayName,
      passwordHash,
      emailVerified,
      passwordUpdatedAt,
      const DeepCollectionEquality().hash(_providerUserInfo),
      validSince,
      disabled,
      lastLoginAt,
      createdAt,
      lastRefreshAt);

  @override
  String toString() {
    return 'UserElementData(localId: $localId, email: $email, displayName: $displayName, passwordHash: $passwordHash, emailVerified: $emailVerified, passwordUpdatedAt: $passwordUpdatedAt, providerUserInfo: $providerUserInfo, validSince: $validSince, disabled: $disabled, lastLoginAt: $lastLoginAt, createdAt: $createdAt, lastRefreshAt: $lastRefreshAt)';
  }
}

/// @nodoc
abstract mixin class _$UserElementDataCopyWith<$Res>
    implements $UserElementDataCopyWith<$Res> {
  factory _$UserElementDataCopyWith(
          _UserElementData value, $Res Function(_UserElementData) _then) =
      __$UserElementDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? localId,
      String? email,
      String? displayName,
      String? passwordHash,
      bool? emailVerified,
      int? passwordUpdatedAt,
      List<ProviderUserInfo>? providerUserInfo,
      String? validSince,
      bool? disabled,
      String? lastLoginAt,
      String? createdAt,
      DateTime? lastRefreshAt});
}

/// @nodoc
class __$UserElementDataCopyWithImpl<$Res>
    implements _$UserElementDataCopyWith<$Res> {
  __$UserElementDataCopyWithImpl(this._self, this._then);

  final _UserElementData _self;
  final $Res Function(_UserElementData) _then;

  /// Create a copy of UserElementData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? localId = freezed,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? passwordHash = freezed,
    Object? emailVerified = freezed,
    Object? passwordUpdatedAt = freezed,
    Object? providerUserInfo = freezed,
    Object? validSince = freezed,
    Object? disabled = freezed,
    Object? lastLoginAt = freezed,
    Object? createdAt = freezed,
    Object? lastRefreshAt = freezed,
  }) {
    return _then(_UserElementData(
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
      passwordHash: freezed == passwordHash
          ? _self.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordUpdatedAt: freezed == passwordUpdatedAt
          ? _self.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      providerUserInfo: freezed == providerUserInfo
          ? _self._providerUserInfo
          : providerUserInfo // ignore: cast_nullable_to_non_nullable
              as List<ProviderUserInfo>?,
      validSince: freezed == validSince
          ? _self.validSince
          : validSince // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _self.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _self.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRefreshAt: freezed == lastRefreshAt
          ? _self.lastRefreshAt
          : lastRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$ProviderUserInfo {
  String? get providerId;
  String? get displayName;
  String? get federatedId;
  String? get email;
  String? get rawId;

  /// Create a copy of ProviderUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProviderUserInfoCopyWith<ProviderUserInfo> get copyWith =>
      _$ProviderUserInfoCopyWithImpl<ProviderUserInfo>(
          this as ProviderUserInfo, _$identity);

  /// Serializes this ProviderUserInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProviderUserInfo &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.federatedId, federatedId) ||
                other.federatedId == federatedId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rawId, rawId) || other.rawId == rawId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, providerId, displayName, federatedId, email, rawId);

  @override
  String toString() {
    return 'ProviderUserInfo(providerId: $providerId, displayName: $displayName, federatedId: $federatedId, email: $email, rawId: $rawId)';
  }
}

/// @nodoc
abstract mixin class $ProviderUserInfoCopyWith<$Res> {
  factory $ProviderUserInfoCopyWith(
          ProviderUserInfo value, $Res Function(ProviderUserInfo) _then) =
      _$ProviderUserInfoCopyWithImpl;
  @useResult
  $Res call(
      {String? providerId,
      String? displayName,
      String? federatedId,
      String? email,
      String? rawId});
}

/// @nodoc
class _$ProviderUserInfoCopyWithImpl<$Res>
    implements $ProviderUserInfoCopyWith<$Res> {
  _$ProviderUserInfoCopyWithImpl(this._self, this._then);

  final ProviderUserInfo _self;
  final $Res Function(ProviderUserInfo) _then;

  /// Create a copy of ProviderUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? displayName = freezed,
    Object? federatedId = freezed,
    Object? email = freezed,
    Object? rawId = freezed,
  }) {
    return _then(_self.copyWith(
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      federatedId: freezed == federatedId
          ? _self.federatedId
          : federatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      rawId: freezed == rawId
          ? _self.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ProviderUserInfo].
extension ProviderUserInfoPatterns on ProviderUserInfo {
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
    TResult Function(_ProviderUserInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo() when $default != null:
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
    TResult Function(_ProviderUserInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo():
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
    TResult? Function(_ProviderUserInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo() when $default != null:
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
    TResult Function(String? providerId, String? displayName,
            String? federatedId, String? email, String? rawId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo() when $default != null:
        return $default(_that.providerId, _that.displayName, _that.federatedId,
            _that.email, _that.rawId);
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
    TResult Function(String? providerId, String? displayName,
            String? federatedId, String? email, String? rawId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo():
        return $default(_that.providerId, _that.displayName, _that.federatedId,
            _that.email, _that.rawId);
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
    TResult? Function(String? providerId, String? displayName,
            String? federatedId, String? email, String? rawId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProviderUserInfo() when $default != null:
        return $default(_that.providerId, _that.displayName, _that.federatedId,
            _that.email, _that.rawId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProviderUserInfo implements ProviderUserInfo {
  const _ProviderUserInfo(
      {this.providerId,
      this.displayName,
      this.federatedId,
      this.email,
      this.rawId});
  factory _ProviderUserInfo.fromJson(Map<String, dynamic> json) =>
      _$ProviderUserInfoFromJson(json);

  @override
  final String? providerId;
  @override
  final String? displayName;
  @override
  final String? federatedId;
  @override
  final String? email;
  @override
  final String? rawId;

  /// Create a copy of ProviderUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProviderUserInfoCopyWith<_ProviderUserInfo> get copyWith =>
      __$ProviderUserInfoCopyWithImpl<_ProviderUserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProviderUserInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProviderUserInfo &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.federatedId, federatedId) ||
                other.federatedId == federatedId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rawId, rawId) || other.rawId == rawId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, providerId, displayName, federatedId, email, rawId);

  @override
  String toString() {
    return 'ProviderUserInfo(providerId: $providerId, displayName: $displayName, federatedId: $federatedId, email: $email, rawId: $rawId)';
  }
}

/// @nodoc
abstract mixin class _$ProviderUserInfoCopyWith<$Res>
    implements $ProviderUserInfoCopyWith<$Res> {
  factory _$ProviderUserInfoCopyWith(
          _ProviderUserInfo value, $Res Function(_ProviderUserInfo) _then) =
      __$ProviderUserInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? providerId,
      String? displayName,
      String? federatedId,
      String? email,
      String? rawId});
}

/// @nodoc
class __$ProviderUserInfoCopyWithImpl<$Res>
    implements _$ProviderUserInfoCopyWith<$Res> {
  __$ProviderUserInfoCopyWithImpl(this._self, this._then);

  final _ProviderUserInfo _self;
  final $Res Function(_ProviderUserInfo) _then;

  /// Create a copy of ProviderUserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? providerId = freezed,
    Object? displayName = freezed,
    Object? federatedId = freezed,
    Object? email = freezed,
    Object? rawId = freezed,
  }) {
    return _then(_ProviderUserInfo(
      providerId: freezed == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      federatedId: freezed == federatedId
          ? _self.federatedId
          : federatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      rawId: freezed == rawId
          ? _self.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
