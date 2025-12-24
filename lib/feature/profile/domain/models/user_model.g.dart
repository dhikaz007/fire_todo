// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      kind: json['kind'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserElementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'users': instance.users,
    };

_$UserElementDataImpl _$$UserElementDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserElementDataImpl(
      localId: json['localId'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      passwordHash: json['passwordHash'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      passwordUpdatedAt: (json['passwordUpdatedAt'] as num?)?.toInt(),
      providerUserInfo: (json['providerUserInfo'] as List<dynamic>?)
          ?.map((e) => ProviderUserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      validSince: json['validSince'] as String?,
      disabled: json['disabled'] as bool?,
      lastLoginAt: json['lastLoginAt'] as String?,
      createdAt: json['createdAt'] as String?,
      lastRefreshAt: json['lastRefreshAt'] == null
          ? null
          : DateTime.parse(json['lastRefreshAt'] as String),
    );

Map<String, dynamic> _$$UserElementDataImplToJson(
        _$UserElementDataImpl instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'email': instance.email,
      'displayName': instance.displayName,
      'passwordHash': instance.passwordHash,
      'emailVerified': instance.emailVerified,
      'passwordUpdatedAt': instance.passwordUpdatedAt,
      'providerUserInfo': instance.providerUserInfo,
      'validSince': instance.validSince,
      'disabled': instance.disabled,
      'lastLoginAt': instance.lastLoginAt,
      'createdAt': instance.createdAt,
      'lastRefreshAt': instance.lastRefreshAt?.toIso8601String(),
    };

_$ProviderUserInfoImpl _$$ProviderUserInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProviderUserInfoImpl(
      providerId: json['providerId'] as String?,
      displayName: json['displayName'] as String?,
      federatedId: json['federatedId'] as String?,
      email: json['email'] as String?,
      rawId: json['rawId'] as String?,
    );

Map<String, dynamic> _$$ProviderUserInfoImplToJson(
        _$ProviderUserInfoImpl instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'displayName': instance.displayName,
      'federatedId': instance.federatedId,
      'email': instance.email,
      'rawId': instance.rawId,
    };
