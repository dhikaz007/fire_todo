// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      kind: json['kind'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => UserElementData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'users': instance.users,
    };

_UserElementData _$UserElementDataFromJson(Map<String, dynamic> json) =>
    _UserElementData(
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

Map<String, dynamic> _$UserElementDataToJson(_UserElementData instance) =>
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

_ProviderUserInfo _$ProviderUserInfoFromJson(Map<String, dynamic> json) =>
    _ProviderUserInfo(
      providerId: json['providerId'] as String?,
      displayName: json['displayName'] as String?,
      federatedId: json['federatedId'] as String?,
      email: json['email'] as String?,
      rawId: json['rawId'] as String?,
    );

Map<String, dynamic> _$ProviderUserInfoToJson(_ProviderUserInfo instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'displayName': instance.displayName,
      'federatedId': instance.federatedId,
      'email': instance.email,
      'rawId': instance.rawId,
    };
