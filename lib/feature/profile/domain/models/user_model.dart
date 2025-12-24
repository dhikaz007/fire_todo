import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed(toJson: true, toStringOverride: true)
sealed class UserModel with _$UserModel {
  const factory UserModel({
    String? kind,
    List<UserElementData>? users,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // const UserModel({
  //   this.kind,
  //   this.users,
  // });

  // factory UserModel.fromJSON(Map<String, dynamic> json) => UserModel(
  //       kind: json["kind"],
  //       users: json["users"] == null
  //           ? []
  //           : List.from(json["users"]!.map((x) => UserElementData.fromJSON(x))),
  //     );

  // @override
  // String toString() => 'UserModel(kind: $kind, users: $users)';
}

@Freezed(toJson: true, toStringOverride: true)
sealed class UserElementData with _$UserElementData {
  const factory UserElementData({
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
    DateTime? lastRefreshAt,
  }) = _UserElementData;

  factory UserElementData.fromJson(Map<String, dynamic> json) =>
      _$UserElementDataFromJson(json);

  // const UserElementData({
  //   this.localId,
  //   this.email,
  //   this.displayName,
  //   this.passwordHash,
  //   this.emailVerified,
  //   this.passwordUpdatedAt,
  //   this.providerUserInfo,
  //   this.validSince,
  //   this.disabled,
  //   this.lastLoginAt,
  //   this.createdAt,
  //   this.lastRefreshAt,
  // });

  // factory UserElementData.fromJSON(Map<String, dynamic> json) =>
  //     UserElementData(
  //       localId: json["localId"],
  //       email: json["email"],
  //       displayName: json["displayName"],
  //       passwordHash: json["passwordHash"],
  //       emailVerified: json["emailVerified"],
  //       passwordUpdatedAt: json["passwordUpdatedAt"],
  //       providerUserInfo: json["providerUserInfo"] == null
  //           ? []
  //           : List.from(json["providerUserInfo"]!
  //               .map((x) => ProviderUserInfo.fromJSON(x))),
  //       validSince: json["validSince"],
  //       disabled: json["disabled"],
  //       lastLoginAt: json["lastLoginAt"],
  //       createdAt: json["createdAt"],
  //       lastRefreshAt: json["lastRefreshAt"] == null
  //           ? null
  //           : DateTime.parse(json["lastRefreshAt"] as String),
  //     );

  // @override
  // String toString() {
  //   return 'UserElementData(localId: $localId, email: $email, displayName: $displayName, passwordHash: $passwordHash, emailVerified: $emailVerified, passwordUpdatedAt: $passwordUpdatedAt, providerUserInfo: $providerUserInfo, validSince: $validSince, disabled: $disabled, lastLoginAt: $lastLoginAt, createdAt: $createdAt, lastRefreshAt: $lastRefreshAt)';
  // }
}

@Freezed(toJson: true, toStringOverride: true)
sealed class ProviderUserInfo with _$ProviderUserInfo {
  const factory ProviderUserInfo({
    String? providerId,
    String? displayName,
    String? federatedId,
    String? email,
    String? rawId,
  }) = _ProviderUserInfo;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) =>
      _$ProviderUserInfoFromJson(json);

  // const ProviderUserInfo({
  //   this.providerId,
  //   this.displayName,
  //   this.federatedId,
  //   this.email,
  //   this.rawId,
  // });

  // factory ProviderUserInfo.fromJSON(Map<String, dynamic> map) {
  //   return ProviderUserInfo(
  //     providerId:
  //         map['providerId'] != null ? map['providerId'] as String : null,
  //     displayName:
  //         map['displayName'] != null ? map['displayName'] as String : null,
  //     federatedId:
  //         map['federatedId'] != null ? map['federatedId'] as String : null,
  //     email: map['email'] != null ? map['email'] as String : null,
  //     rawId: map['rawId'] != null ? map['rawId'] as String : null,
  //   );
  // }

  // @override
  // String toString() {
  //   return 'ProviderUserInfo(providerId: $providerId, displayName: $displayName, federatedId: $federatedId, email: $email, rawId: $rawId)';
  // }
}
