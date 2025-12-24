// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get kind => throw _privateConstructorUsedError;
  List<UserElementData>? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({String? kind, List<UserElementData>? users});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserElementData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind, List<UserElementData>? users});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? users = freezed,
  }) {
    return _then(_$UserModelImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserElementData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({this.kind, final List<UserElementData>? users})
      : _users = users;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

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

  @override
  String toString() {
    return 'UserModel(kind: $kind, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? kind,
      final List<UserElementData>? users}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get kind;
  @override
  List<UserElementData>? get users;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserElementData _$UserElementDataFromJson(Map<String, dynamic> json) {
  return _UserElementData.fromJson(json);
}

/// @nodoc
mixin _$UserElementData {
  String? get localId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get passwordHash => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  int? get passwordUpdatedAt => throw _privateConstructorUsedError;
  List<ProviderUserInfo>? get providerUserInfo =>
      throw _privateConstructorUsedError;
  String? get validSince => throw _privateConstructorUsedError;
  bool? get disabled => throw _privateConstructorUsedError;
  String? get lastLoginAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastRefreshAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserElementDataCopyWith<UserElementData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserElementDataCopyWith<$Res> {
  factory $UserElementDataCopyWith(
          UserElementData value, $Res Function(UserElementData) then) =
      _$UserElementDataCopyWithImpl<$Res, UserElementData>;
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
class _$UserElementDataCopyWithImpl<$Res, $Val extends UserElementData>
    implements $UserElementDataCopyWith<$Res> {
  _$UserElementDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordUpdatedAt: freezed == passwordUpdatedAt
          ? _value.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      providerUserInfo: freezed == providerUserInfo
          ? _value.providerUserInfo
          : providerUserInfo // ignore: cast_nullable_to_non_nullable
              as List<ProviderUserInfo>?,
      validSince: freezed == validSince
          ? _value.validSince
          : validSince // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRefreshAt: freezed == lastRefreshAt
          ? _value.lastRefreshAt
          : lastRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserElementDataImplCopyWith<$Res>
    implements $UserElementDataCopyWith<$Res> {
  factory _$$UserElementDataImplCopyWith(_$UserElementDataImpl value,
          $Res Function(_$UserElementDataImpl) then) =
      __$$UserElementDataImplCopyWithImpl<$Res>;
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
class __$$UserElementDataImplCopyWithImpl<$Res>
    extends _$UserElementDataCopyWithImpl<$Res, _$UserElementDataImpl>
    implements _$$UserElementDataImplCopyWith<$Res> {
  __$$UserElementDataImplCopyWithImpl(
      _$UserElementDataImpl _value, $Res Function(_$UserElementDataImpl) _then)
      : super(_value, _then);

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
    return _then(_$UserElementDataImpl(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordHash: freezed == passwordHash
          ? _value.passwordHash
          : passwordHash // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      passwordUpdatedAt: freezed == passwordUpdatedAt
          ? _value.passwordUpdatedAt
          : passwordUpdatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      providerUserInfo: freezed == providerUserInfo
          ? _value._providerUserInfo
          : providerUserInfo // ignore: cast_nullable_to_non_nullable
              as List<ProviderUserInfo>?,
      validSince: freezed == validSince
          ? _value.validSince
          : validSince // ignore: cast_nullable_to_non_nullable
              as String?,
      disabled: freezed == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastRefreshAt: freezed == lastRefreshAt
          ? _value.lastRefreshAt
          : lastRefreshAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserElementDataImpl implements _UserElementData {
  const _$UserElementDataImpl(
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

  factory _$UserElementDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserElementDataImplFromJson(json);

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

  @override
  String toString() {
    return 'UserElementData(localId: $localId, email: $email, displayName: $displayName, passwordHash: $passwordHash, emailVerified: $emailVerified, passwordUpdatedAt: $passwordUpdatedAt, providerUserInfo: $providerUserInfo, validSince: $validSince, disabled: $disabled, lastLoginAt: $lastLoginAt, createdAt: $createdAt, lastRefreshAt: $lastRefreshAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserElementDataImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserElementDataImplCopyWith<_$UserElementDataImpl> get copyWith =>
      __$$UserElementDataImplCopyWithImpl<_$UserElementDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserElementDataImplToJson(
      this,
    );
  }
}

abstract class _UserElementData implements UserElementData {
  const factory _UserElementData(
      {final String? localId,
      final String? email,
      final String? displayName,
      final String? passwordHash,
      final bool? emailVerified,
      final int? passwordUpdatedAt,
      final List<ProviderUserInfo>? providerUserInfo,
      final String? validSince,
      final bool? disabled,
      final String? lastLoginAt,
      final String? createdAt,
      final DateTime? lastRefreshAt}) = _$UserElementDataImpl;

  factory _UserElementData.fromJson(Map<String, dynamic> json) =
      _$UserElementDataImpl.fromJson;

  @override
  String? get localId;
  @override
  String? get email;
  @override
  String? get displayName;
  @override
  String? get passwordHash;
  @override
  bool? get emailVerified;
  @override
  int? get passwordUpdatedAt;
  @override
  List<ProviderUserInfo>? get providerUserInfo;
  @override
  String? get validSince;
  @override
  bool? get disabled;
  @override
  String? get lastLoginAt;
  @override
  String? get createdAt;
  @override
  DateTime? get lastRefreshAt;
  @override
  @JsonKey(ignore: true)
  _$$UserElementDataImplCopyWith<_$UserElementDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProviderUserInfo _$ProviderUserInfoFromJson(Map<String, dynamic> json) {
  return _ProviderUserInfo.fromJson(json);
}

/// @nodoc
mixin _$ProviderUserInfo {
  String? get providerId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get federatedId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get rawId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProviderUserInfoCopyWith<ProviderUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderUserInfoCopyWith<$Res> {
  factory $ProviderUserInfoCopyWith(
          ProviderUserInfo value, $Res Function(ProviderUserInfo) then) =
      _$ProviderUserInfoCopyWithImpl<$Res, ProviderUserInfo>;
  @useResult
  $Res call(
      {String? providerId,
      String? displayName,
      String? federatedId,
      String? email,
      String? rawId});
}

/// @nodoc
class _$ProviderUserInfoCopyWithImpl<$Res, $Val extends ProviderUserInfo>
    implements $ProviderUserInfoCopyWith<$Res> {
  _$ProviderUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? displayName = freezed,
    Object? federatedId = freezed,
    Object? email = freezed,
    Object? rawId = freezed,
  }) {
    return _then(_value.copyWith(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      federatedId: freezed == federatedId
          ? _value.federatedId
          : federatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      rawId: freezed == rawId
          ? _value.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderUserInfoImplCopyWith<$Res>
    implements $ProviderUserInfoCopyWith<$Res> {
  factory _$$ProviderUserInfoImplCopyWith(_$ProviderUserInfoImpl value,
          $Res Function(_$ProviderUserInfoImpl) then) =
      __$$ProviderUserInfoImplCopyWithImpl<$Res>;
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
class __$$ProviderUserInfoImplCopyWithImpl<$Res>
    extends _$ProviderUserInfoCopyWithImpl<$Res, _$ProviderUserInfoImpl>
    implements _$$ProviderUserInfoImplCopyWith<$Res> {
  __$$ProviderUserInfoImplCopyWithImpl(_$ProviderUserInfoImpl _value,
      $Res Function(_$ProviderUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = freezed,
    Object? displayName = freezed,
    Object? federatedId = freezed,
    Object? email = freezed,
    Object? rawId = freezed,
  }) {
    return _then(_$ProviderUserInfoImpl(
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      federatedId: freezed == federatedId
          ? _value.federatedId
          : federatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      rawId: freezed == rawId
          ? _value.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderUserInfoImpl implements _ProviderUserInfo {
  const _$ProviderUserInfoImpl(
      {this.providerId,
      this.displayName,
      this.federatedId,
      this.email,
      this.rawId});

  factory _$ProviderUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderUserInfoImplFromJson(json);

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

  @override
  String toString() {
    return 'ProviderUserInfo(providerId: $providerId, displayName: $displayName, federatedId: $federatedId, email: $email, rawId: $rawId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderUserInfoImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.federatedId, federatedId) ||
                other.federatedId == federatedId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.rawId, rawId) || other.rawId == rawId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, providerId, displayName, federatedId, email, rawId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderUserInfoImplCopyWith<_$ProviderUserInfoImpl> get copyWith =>
      __$$ProviderUserInfoImplCopyWithImpl<_$ProviderUserInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderUserInfoImplToJson(
      this,
    );
  }
}

abstract class _ProviderUserInfo implements ProviderUserInfo {
  const factory _ProviderUserInfo(
      {final String? providerId,
      final String? displayName,
      final String? federatedId,
      final String? email,
      final String? rawId}) = _$ProviderUserInfoImpl;

  factory _ProviderUserInfo.fromJson(Map<String, dynamic> json) =
      _$ProviderUserInfoImpl.fromJson;

  @override
  String? get providerId;
  @override
  String? get displayName;
  @override
  String? get federatedId;
  @override
  String? get email;
  @override
  String? get rawId;
  @override
  @JsonKey(ignore: true)
  _$$ProviderUserInfoImplCopyWith<_$ProviderUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
