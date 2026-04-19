// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListTodoModel _$ListTodoModelFromJson(Map<String, dynamic> json) =>
    _ListTodoModel(
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTodoModelToJson(_ListTodoModel instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };

_DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) =>
    _DocumentModel(
      name: json['name'] as String?,
      fields: json['fields'] == null
          ? null
          : FieldsModel.fromJson(json['fields'] as Map<String, dynamic>),
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$DocumentModelToJson(_DocumentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };

_FieldsModel _$FieldsModelFromJson(Map<String, dynamic> json) => _FieldsModel(
      title: json['title'] == null
          ? null
          : DescriptionValueModel.fromJson(
              json['title'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : DescriptionValueModel.fromJson(
              json['description'] as Map<String, dynamic>),
      isDone: json['isDone'] == null
          ? null
          : IsDoneValueModel.fromJson(json['isDone'] as Map<String, dynamic>),
      dueDate: json['dueDate'] == null
          ? null
          : DueDateValueModel.fromJson(json['dueDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FieldsModelToJson(_FieldsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isDone': instance.isDone,
      'dueDate': instance.dueDate,
    };

_DueDateValueModel _$DueDateValueModelFromJson(Map<String, dynamic> json) =>
    _DueDateValueModel(
      timestampValue: const FirestoreDateTimeConverter()
          .fromJson(json['timestampValue'] as String?),
    );

Map<String, dynamic> _$DueDateValueModelToJson(_DueDateValueModel instance) =>
    <String, dynamic>{
      'timestampValue':
          const FirestoreDateTimeConverter().toJson(instance.timestampValue),
    };

_DescriptionValueModel _$DescriptionValueModelFromJson(
        Map<String, dynamic> json) =>
    _DescriptionValueModel(
      stringValue: json['stringValue'] as String?,
    );

Map<String, dynamic> _$DescriptionValueModelToJson(
        _DescriptionValueModel instance) =>
    <String, dynamic>{
      'stringValue': instance.stringValue,
    };

_IsDoneValueModel _$IsDoneValueModelFromJson(Map<String, dynamic> json) =>
    _IsDoneValueModel(
      booleanValue: json['booleanValue'] as bool?,
    );

Map<String, dynamic> _$IsDoneValueModelToJson(_IsDoneValueModel instance) =>
    <String, dynamic>{
      'booleanValue': instance.booleanValue,
    };
