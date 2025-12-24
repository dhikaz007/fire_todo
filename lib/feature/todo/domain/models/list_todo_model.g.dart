// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListTodoModelImpl _$$ListTodoModelImplFromJson(Map<String, dynamic> json) =>
    _$ListTodoModelImpl(
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListTodoModelImplToJson(_$ListTodoModelImpl instance) =>
    <String, dynamic>{
      'documents': instance.documents,
    };

_$DocumentModelImpl _$$DocumentModelImplFromJson(Map<String, dynamic> json) =>
    _$DocumentModelImpl(
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

Map<String, dynamic> _$$DocumentModelImplToJson(_$DocumentModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
    };

_$FieldsModelImpl _$$FieldsModelImplFromJson(Map<String, dynamic> json) =>
    _$FieldsModelImpl(
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

Map<String, dynamic> _$$FieldsModelImplToJson(_$FieldsModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isDone': instance.isDone,
      'dueDate': instance.dueDate,
    };

_$DueDateValueModelImpl _$$DueDateValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DueDateValueModelImpl(
      timestampValue: const FirestoreDateTimeConverter()
          .fromJson(json['timestampValue'] as String?),
    );

Map<String, dynamic> _$$DueDateValueModelImplToJson(
        _$DueDateValueModelImpl instance) =>
    <String, dynamic>{
      'timestampValue':
          const FirestoreDateTimeConverter().toJson(instance.timestampValue),
    };

_$DescriptionValueModelImpl _$$DescriptionValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DescriptionValueModelImpl(
      stringValue: json['stringValue'] as String?,
    );

Map<String, dynamic> _$$DescriptionValueModelImplToJson(
        _$DescriptionValueModelImpl instance) =>
    <String, dynamic>{
      'stringValue': instance.stringValue,
    };

_$IsDoneValueModelImpl _$$IsDoneValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IsDoneValueModelImpl(
      booleanValue: json['booleanValue'] as bool?,
    );

Map<String, dynamic> _$$IsDoneValueModelImplToJson(
        _$IsDoneValueModelImpl instance) =>
    <String, dynamic>{
      'booleanValue': instance.booleanValue,
    };
