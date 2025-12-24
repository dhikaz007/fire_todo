import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@Freezed(toJson: true, toStringOverride: true)
sealed class LoginModel with _$LoginModel {
  const factory LoginModel({
    String? kind,
    String? localId,
    String? email,
    String? displayName,
    String? idToken,
    bool? registered,
    String? refreshToken,
    String? expiresIn,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
