import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_model.freezed.dart';
part 'sign_up_model.g.dart';

@Freezed(toStringOverride: true, toJson: true)
sealed class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    String? kind,
    String? idToken,
    String? email,
    String? refreshToken,
    String? expiresIn,
    String? localId,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  
}
