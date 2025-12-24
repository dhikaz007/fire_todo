import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_todo_model.freezed.dart';
part 'list_todo_model.g.dart';

class FirestoreDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const FirestoreDateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null) return null;
    return DateTime.parse(json).toLocal();
  }

  @override
  String? toJson(DateTime? object) {
    // Ini kuncinya: .toUtc() akan memastikan string diakhiri dengan 'Z'
    return object?.toUtc().toIso8601String();
  }
}

@Freezed(toJson: true, toStringOverride: true)
sealed class ListTodoModel with _$ListTodoModel {
  const factory ListTodoModel({
    List<DocumentModel>? documents,
  }) = _ListTodoModel;

  factory ListTodoModel.fromJson(Map<String, dynamic> json) =>
      _$ListTodoModelFromJson(json);
}

@Freezed(toJson: true, toStringOverride: true)
sealed class DocumentModel with _$DocumentModel {
  const factory DocumentModel({
    String? name,
    FieldsModel? fields,
    DateTime? createTime,
    DateTime? updateTime,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
}

@Freezed(toJson: true, toStringOverride: true)
sealed class FieldsModel with _$FieldsModel {
  const factory FieldsModel({
    DescriptionValueModel? title,
    DescriptionValueModel? description,
    IsDoneValueModel? isDone,
    DueDateValueModel? dueDate,
  }) = _FieldsModel;

  factory FieldsModel.fromJson(Map<String, dynamic> json) =>
      _$FieldsModelFromJson(json);
}

@Freezed(toJson: true, toStringOverride: true)
sealed class DueDateValueModel with _$DueDateValueModel {
  const factory DueDateValueModel({
    @FirestoreDateTimeConverter() DateTime? timestampValue,
  }) = _DueDateValueModel;

  factory DueDateValueModel.fromJson(Map<String, dynamic> json) =>
      _$DueDateValueModelFromJson(json);
}

@Freezed(toJson: true, toStringOverride: true)
sealed class DescriptionValueModel with _$DescriptionValueModel {
  const factory DescriptionValueModel({
    String? stringValue,
  }) = _DescriptionValueModel;

  factory DescriptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$DescriptionValueModelFromJson(json);
}

@Freezed(toJson: true, toStringOverride: true)
sealed class IsDoneValueModel with _$IsDoneValueModel {
  const factory IsDoneValueModel({
    bool? booleanValue,
  }) = _IsDoneValueModel;

  factory IsDoneValueModel.fromJson(Map<String, dynamic> json) =>
      _$IsDoneValueModelFromJson(json);
}
