import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_email_model.freezed.dart';
part 'request_email_model.g.dart';

@Freezed(toJson: true, toStringOverride: true)
sealed class RequestEmailModel with _$RequestEmailModel {
  const factory RequestEmailModel({String? kind, String? email}) =
      _RequestEmailModel;

  factory RequestEmailModel.fromJson(Map<String, dynamic> json) =>
      _$RequestEmailModelFromJson(json);
}
