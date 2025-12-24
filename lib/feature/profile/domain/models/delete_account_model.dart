import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_model.freezed.dart';
part 'delete_account_model.g.dart';

@Freezed(toJson: true, toStringOverride: true)
sealed class DeleteAccountModel with _$DeleteAccountModel {
  const factory DeleteAccountModel({String? kind}) = _DeleteAccountModel;

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountModelFromJson(json);

  // const DeleteAccountModel({this.kind});

  // factory DeleteAccountModel.fromJSON(Map<String, dynamic> json) {
  //   return DeleteAccountModel(
  //     kind: json['kind'] != null ? json['kind'] as String : null,
  //   );
  // }

  // @override
  // String toString() => 'DeleteAccountModel(kind: $kind)';
}
