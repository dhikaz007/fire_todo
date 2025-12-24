// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListTodoModel _$ListTodoModelFromJson(Map<String, dynamic> json) {
  return _ListTodoModel.fromJson(json);
}

/// @nodoc
mixin _$ListTodoModel {
  List<DocumentModel>? get documents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListTodoModelCopyWith<ListTodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTodoModelCopyWith<$Res> {
  factory $ListTodoModelCopyWith(
          ListTodoModel value, $Res Function(ListTodoModel) then) =
      _$ListTodoModelCopyWithImpl<$Res, ListTodoModel>;
  @useResult
  $Res call({List<DocumentModel>? documents});
}

/// @nodoc
class _$ListTodoModelCopyWithImpl<$Res, $Val extends ListTodoModel>
    implements $ListTodoModelCopyWith<$Res> {
  _$ListTodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = freezed,
  }) {
    return _then(_value.copyWith(
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListTodoModelImplCopyWith<$Res>
    implements $ListTodoModelCopyWith<$Res> {
  factory _$$ListTodoModelImplCopyWith(
          _$ListTodoModelImpl value, $Res Function(_$ListTodoModelImpl) then) =
      __$$ListTodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DocumentModel>? documents});
}

/// @nodoc
class __$$ListTodoModelImplCopyWithImpl<$Res>
    extends _$ListTodoModelCopyWithImpl<$Res, _$ListTodoModelImpl>
    implements _$$ListTodoModelImplCopyWith<$Res> {
  __$$ListTodoModelImplCopyWithImpl(
      _$ListTodoModelImpl _value, $Res Function(_$ListTodoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documents = freezed,
  }) {
    return _then(_$ListTodoModelImpl(
      documents: freezed == documents
          ? _value._documents
          : documents // ignore: cast_nullable_to_non_nullable
              as List<DocumentModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListTodoModelImpl implements _ListTodoModel {
  const _$ListTodoModelImpl({final List<DocumentModel>? documents})
      : _documents = documents;

  factory _$ListTodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListTodoModelImplFromJson(json);

  final List<DocumentModel>? _documents;
  @override
  List<DocumentModel>? get documents {
    final value = _documents;
    if (value == null) return null;
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ListTodoModel(documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListTodoModelImpl &&
            const DeepCollectionEquality()
                .equals(other._documents, _documents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_documents));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListTodoModelImplCopyWith<_$ListTodoModelImpl> get copyWith =>
      __$$ListTodoModelImplCopyWithImpl<_$ListTodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListTodoModelImplToJson(
      this,
    );
  }
}

abstract class _ListTodoModel implements ListTodoModel {
  const factory _ListTodoModel({final List<DocumentModel>? documents}) =
      _$ListTodoModelImpl;

  factory _ListTodoModel.fromJson(Map<String, dynamic> json) =
      _$ListTodoModelImpl.fromJson;

  @override
  List<DocumentModel>? get documents;
  @override
  @JsonKey(ignore: true)
  _$$ListTodoModelImplCopyWith<_$ListTodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentModel _$DocumentModelFromJson(Map<String, dynamic> json) {
  return _DocumentModel.fromJson(json);
}

/// @nodoc
mixin _$DocumentModel {
  String? get name => throw _privateConstructorUsedError;
  FieldsModel? get fields => throw _privateConstructorUsedError;
  DateTime? get createTime => throw _privateConstructorUsedError;
  DateTime? get updateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentModelCopyWith<DocumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentModelCopyWith<$Res> {
  factory $DocumentModelCopyWith(
          DocumentModel value, $Res Function(DocumentModel) then) =
      _$DocumentModelCopyWithImpl<$Res, DocumentModel>;
  @useResult
  $Res call(
      {String? name,
      FieldsModel? fields,
      DateTime? createTime,
      DateTime? updateTime});

  $FieldsModelCopyWith<$Res>? get fields;
}

/// @nodoc
class _$DocumentModelCopyWithImpl<$Res, $Val extends DocumentModel>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fields = freezed,
    Object? createTime = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as FieldsModel?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldsModelCopyWith<$Res>? get fields {
    if (_value.fields == null) {
      return null;
    }

    return $FieldsModelCopyWith<$Res>(_value.fields!, (value) {
      return _then(_value.copyWith(fields: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocumentModelImplCopyWith<$Res>
    implements $DocumentModelCopyWith<$Res> {
  factory _$$DocumentModelImplCopyWith(
          _$DocumentModelImpl value, $Res Function(_$DocumentModelImpl) then) =
      __$$DocumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      FieldsModel? fields,
      DateTime? createTime,
      DateTime? updateTime});

  @override
  $FieldsModelCopyWith<$Res>? get fields;
}

/// @nodoc
class __$$DocumentModelImplCopyWithImpl<$Res>
    extends _$DocumentModelCopyWithImpl<$Res, _$DocumentModelImpl>
    implements _$$DocumentModelImplCopyWith<$Res> {
  __$$DocumentModelImplCopyWithImpl(
      _$DocumentModelImpl _value, $Res Function(_$DocumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? fields = freezed,
    Object? createTime = freezed,
    Object? updateTime = freezed,
  }) {
    return _then(_$DocumentModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fields: freezed == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as FieldsModel?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateTime: freezed == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentModelImpl implements _DocumentModel {
  const _$DocumentModelImpl(
      {this.name, this.fields, this.createTime, this.updateTime});

  factory _$DocumentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentModelImplFromJson(json);

  @override
  final String? name;
  @override
  final FieldsModel? fields;
  @override
  final DateTime? createTime;
  @override
  final DateTime? updateTime;

  @override
  String toString() {
    return 'DocumentModel(name: $name, fields: $fields, createTime: $createTime, updateTime: $updateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fields, fields) || other.fields == fields) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, fields, createTime, updateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      __$$DocumentModelImplCopyWithImpl<_$DocumentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentModelImplToJson(
      this,
    );
  }
}

abstract class _DocumentModel implements DocumentModel {
  const factory _DocumentModel(
      {final String? name,
      final FieldsModel? fields,
      final DateTime? createTime,
      final DateTime? updateTime}) = _$DocumentModelImpl;

  factory _DocumentModel.fromJson(Map<String, dynamic> json) =
      _$DocumentModelImpl.fromJson;

  @override
  String? get name;
  @override
  FieldsModel? get fields;
  @override
  DateTime? get createTime;
  @override
  DateTime? get updateTime;
  @override
  @JsonKey(ignore: true)
  _$$DocumentModelImplCopyWith<_$DocumentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FieldsModel _$FieldsModelFromJson(Map<String, dynamic> json) {
  return _FieldsModel.fromJson(json);
}

/// @nodoc
mixin _$FieldsModel {
  DescriptionValueModel? get title => throw _privateConstructorUsedError;
  DescriptionValueModel? get description => throw _privateConstructorUsedError;
  IsDoneValueModel? get isDone => throw _privateConstructorUsedError;
  DueDateValueModel? get dueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsModelCopyWith<FieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsModelCopyWith<$Res> {
  factory $FieldsModelCopyWith(
          FieldsModel value, $Res Function(FieldsModel) then) =
      _$FieldsModelCopyWithImpl<$Res, FieldsModel>;
  @useResult
  $Res call(
      {DescriptionValueModel? title,
      DescriptionValueModel? description,
      IsDoneValueModel? isDone,
      DueDateValueModel? dueDate});

  $DescriptionValueModelCopyWith<$Res>? get title;
  $DescriptionValueModelCopyWith<$Res>? get description;
  $IsDoneValueModelCopyWith<$Res>? get isDone;
  $DueDateValueModelCopyWith<$Res>? get dueDate;
}

/// @nodoc
class _$FieldsModelCopyWithImpl<$Res, $Val extends FieldsModel>
    implements $FieldsModelCopyWith<$Res> {
  _$FieldsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isDone = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as DescriptionValueModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as DescriptionValueModel?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as IsDoneValueModel?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DueDateValueModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DescriptionValueModelCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $DescriptionValueModelCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DescriptionValueModelCopyWith<$Res>? get description {
    if (_value.description == null) {
      return null;
    }

    return $DescriptionValueModelCopyWith<$Res>(_value.description!, (value) {
      return _then(_value.copyWith(description: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IsDoneValueModelCopyWith<$Res>? get isDone {
    if (_value.isDone == null) {
      return null;
    }

    return $IsDoneValueModelCopyWith<$Res>(_value.isDone!, (value) {
      return _then(_value.copyWith(isDone: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DueDateValueModelCopyWith<$Res>? get dueDate {
    if (_value.dueDate == null) {
      return null;
    }

    return $DueDateValueModelCopyWith<$Res>(_value.dueDate!, (value) {
      return _then(_value.copyWith(dueDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FieldsModelImplCopyWith<$Res>
    implements $FieldsModelCopyWith<$Res> {
  factory _$$FieldsModelImplCopyWith(
          _$FieldsModelImpl value, $Res Function(_$FieldsModelImpl) then) =
      __$$FieldsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DescriptionValueModel? title,
      DescriptionValueModel? description,
      IsDoneValueModel? isDone,
      DueDateValueModel? dueDate});

  @override
  $DescriptionValueModelCopyWith<$Res>? get title;
  @override
  $DescriptionValueModelCopyWith<$Res>? get description;
  @override
  $IsDoneValueModelCopyWith<$Res>? get isDone;
  @override
  $DueDateValueModelCopyWith<$Res>? get dueDate;
}

/// @nodoc
class __$$FieldsModelImplCopyWithImpl<$Res>
    extends _$FieldsModelCopyWithImpl<$Res, _$FieldsModelImpl>
    implements _$$FieldsModelImplCopyWith<$Res> {
  __$$FieldsModelImplCopyWithImpl(
      _$FieldsModelImpl _value, $Res Function(_$FieldsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isDone = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(_$FieldsModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as DescriptionValueModel?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as DescriptionValueModel?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as IsDoneValueModel?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DueDateValueModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FieldsModelImpl implements _FieldsModel {
  const _$FieldsModelImpl(
      {this.title, this.description, this.isDone, this.dueDate});

  factory _$FieldsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FieldsModelImplFromJson(json);

  @override
  final DescriptionValueModel? title;
  @override
  final DescriptionValueModel? description;
  @override
  final IsDoneValueModel? isDone;
  @override
  final DueDateValueModel? dueDate;

  @override
  String toString() {
    return 'FieldsModel(title: $title, description: $description, isDone: $isDone, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, isDone, dueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldsModelImplCopyWith<_$FieldsModelImpl> get copyWith =>
      __$$FieldsModelImplCopyWithImpl<_$FieldsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FieldsModelImplToJson(
      this,
    );
  }
}

abstract class _FieldsModel implements FieldsModel {
  const factory _FieldsModel(
      {final DescriptionValueModel? title,
      final DescriptionValueModel? description,
      final IsDoneValueModel? isDone,
      final DueDateValueModel? dueDate}) = _$FieldsModelImpl;

  factory _FieldsModel.fromJson(Map<String, dynamic> json) =
      _$FieldsModelImpl.fromJson;

  @override
  DescriptionValueModel? get title;
  @override
  DescriptionValueModel? get description;
  @override
  IsDoneValueModel? get isDone;
  @override
  DueDateValueModel? get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$FieldsModelImplCopyWith<_$FieldsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DueDateValueModel _$DueDateValueModelFromJson(Map<String, dynamic> json) {
  return _DueDateValueModel.fromJson(json);
}

/// @nodoc
mixin _$DueDateValueModel {
  @FirestoreDateTimeConverter()
  DateTime? get timestampValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DueDateValueModelCopyWith<DueDateValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueDateValueModelCopyWith<$Res> {
  factory $DueDateValueModelCopyWith(
          DueDateValueModel value, $Res Function(DueDateValueModel) then) =
      _$DueDateValueModelCopyWithImpl<$Res, DueDateValueModel>;
  @useResult
  $Res call({@FirestoreDateTimeConverter() DateTime? timestampValue});
}

/// @nodoc
class _$DueDateValueModelCopyWithImpl<$Res, $Val extends DueDateValueModel>
    implements $DueDateValueModelCopyWith<$Res> {
  _$DueDateValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestampValue = freezed,
  }) {
    return _then(_value.copyWith(
      timestampValue: freezed == timestampValue
          ? _value.timestampValue
          : timestampValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DueDateValueModelImplCopyWith<$Res>
    implements $DueDateValueModelCopyWith<$Res> {
  factory _$$DueDateValueModelImplCopyWith(_$DueDateValueModelImpl value,
          $Res Function(_$DueDateValueModelImpl) then) =
      __$$DueDateValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@FirestoreDateTimeConverter() DateTime? timestampValue});
}

/// @nodoc
class __$$DueDateValueModelImplCopyWithImpl<$Res>
    extends _$DueDateValueModelCopyWithImpl<$Res, _$DueDateValueModelImpl>
    implements _$$DueDateValueModelImplCopyWith<$Res> {
  __$$DueDateValueModelImplCopyWithImpl(_$DueDateValueModelImpl _value,
      $Res Function(_$DueDateValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestampValue = freezed,
  }) {
    return _then(_$DueDateValueModelImpl(
      timestampValue: freezed == timestampValue
          ? _value.timestampValue
          : timestampValue // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DueDateValueModelImpl implements _DueDateValueModel {
  const _$DueDateValueModelImpl(
      {@FirestoreDateTimeConverter() this.timestampValue});

  factory _$DueDateValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DueDateValueModelImplFromJson(json);

  @override
  @FirestoreDateTimeConverter()
  final DateTime? timestampValue;

  @override
  String toString() {
    return 'DueDateValueModel(timestampValue: $timestampValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DueDateValueModelImpl &&
            (identical(other.timestampValue, timestampValue) ||
                other.timestampValue == timestampValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestampValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DueDateValueModelImplCopyWith<_$DueDateValueModelImpl> get copyWith =>
      __$$DueDateValueModelImplCopyWithImpl<_$DueDateValueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DueDateValueModelImplToJson(
      this,
    );
  }
}

abstract class _DueDateValueModel implements DueDateValueModel {
  const factory _DueDateValueModel(
          {@FirestoreDateTimeConverter() final DateTime? timestampValue}) =
      _$DueDateValueModelImpl;

  factory _DueDateValueModel.fromJson(Map<String, dynamic> json) =
      _$DueDateValueModelImpl.fromJson;

  @override
  @FirestoreDateTimeConverter()
  DateTime? get timestampValue;
  @override
  @JsonKey(ignore: true)
  _$$DueDateValueModelImplCopyWith<_$DueDateValueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DescriptionValueModel _$DescriptionValueModelFromJson(
    Map<String, dynamic> json) {
  return _DescriptionValueModel.fromJson(json);
}

/// @nodoc
mixin _$DescriptionValueModel {
  String? get stringValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DescriptionValueModelCopyWith<DescriptionValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptionValueModelCopyWith<$Res> {
  factory $DescriptionValueModelCopyWith(DescriptionValueModel value,
          $Res Function(DescriptionValueModel) then) =
      _$DescriptionValueModelCopyWithImpl<$Res, DescriptionValueModel>;
  @useResult
  $Res call({String? stringValue});
}

/// @nodoc
class _$DescriptionValueModelCopyWithImpl<$Res,
        $Val extends DescriptionValueModel>
    implements $DescriptionValueModelCopyWith<$Res> {
  _$DescriptionValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_value.copyWith(
      stringValue: freezed == stringValue
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DescriptionValueModelImplCopyWith<$Res>
    implements $DescriptionValueModelCopyWith<$Res> {
  factory _$$DescriptionValueModelImplCopyWith(
          _$DescriptionValueModelImpl value,
          $Res Function(_$DescriptionValueModelImpl) then) =
      __$$DescriptionValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? stringValue});
}

/// @nodoc
class __$$DescriptionValueModelImplCopyWithImpl<$Res>
    extends _$DescriptionValueModelCopyWithImpl<$Res,
        _$DescriptionValueModelImpl>
    implements _$$DescriptionValueModelImplCopyWith<$Res> {
  __$$DescriptionValueModelImplCopyWithImpl(_$DescriptionValueModelImpl _value,
      $Res Function(_$DescriptionValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stringValue = freezed,
  }) {
    return _then(_$DescriptionValueModelImpl(
      stringValue: freezed == stringValue
          ? _value.stringValue
          : stringValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptionValueModelImpl implements _DescriptionValueModel {
  const _$DescriptionValueModelImpl({this.stringValue});

  factory _$DescriptionValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptionValueModelImplFromJson(json);

  @override
  final String? stringValue;

  @override
  String toString() {
    return 'DescriptionValueModel(stringValue: $stringValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionValueModelImpl &&
            (identical(other.stringValue, stringValue) ||
                other.stringValue == stringValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stringValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptionValueModelImplCopyWith<_$DescriptionValueModelImpl>
      get copyWith => __$$DescriptionValueModelImplCopyWithImpl<
          _$DescriptionValueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptionValueModelImplToJson(
      this,
    );
  }
}

abstract class _DescriptionValueModel implements DescriptionValueModel {
  const factory _DescriptionValueModel({final String? stringValue}) =
      _$DescriptionValueModelImpl;

  factory _DescriptionValueModel.fromJson(Map<String, dynamic> json) =
      _$DescriptionValueModelImpl.fromJson;

  @override
  String? get stringValue;
  @override
  @JsonKey(ignore: true)
  _$$DescriptionValueModelImplCopyWith<_$DescriptionValueModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

IsDoneValueModel _$IsDoneValueModelFromJson(Map<String, dynamic> json) {
  return _IsDoneValueModel.fromJson(json);
}

/// @nodoc
mixin _$IsDoneValueModel {
  bool? get booleanValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IsDoneValueModelCopyWith<IsDoneValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IsDoneValueModelCopyWith<$Res> {
  factory $IsDoneValueModelCopyWith(
          IsDoneValueModel value, $Res Function(IsDoneValueModel) then) =
      _$IsDoneValueModelCopyWithImpl<$Res, IsDoneValueModel>;
  @useResult
  $Res call({bool? booleanValue});
}

/// @nodoc
class _$IsDoneValueModelCopyWithImpl<$Res, $Val extends IsDoneValueModel>
    implements $IsDoneValueModelCopyWith<$Res> {
  _$IsDoneValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booleanValue = freezed,
  }) {
    return _then(_value.copyWith(
      booleanValue: freezed == booleanValue
          ? _value.booleanValue
          : booleanValue // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IsDoneValueModelImplCopyWith<$Res>
    implements $IsDoneValueModelCopyWith<$Res> {
  factory _$$IsDoneValueModelImplCopyWith(_$IsDoneValueModelImpl value,
          $Res Function(_$IsDoneValueModelImpl) then) =
      __$$IsDoneValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? booleanValue});
}

/// @nodoc
class __$$IsDoneValueModelImplCopyWithImpl<$Res>
    extends _$IsDoneValueModelCopyWithImpl<$Res, _$IsDoneValueModelImpl>
    implements _$$IsDoneValueModelImplCopyWith<$Res> {
  __$$IsDoneValueModelImplCopyWithImpl(_$IsDoneValueModelImpl _value,
      $Res Function(_$IsDoneValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? booleanValue = freezed,
  }) {
    return _then(_$IsDoneValueModelImpl(
      booleanValue: freezed == booleanValue
          ? _value.booleanValue
          : booleanValue // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IsDoneValueModelImpl implements _IsDoneValueModel {
  const _$IsDoneValueModelImpl({this.booleanValue});

  factory _$IsDoneValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IsDoneValueModelImplFromJson(json);

  @override
  final bool? booleanValue;

  @override
  String toString() {
    return 'IsDoneValueModel(booleanValue: $booleanValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsDoneValueModelImpl &&
            (identical(other.booleanValue, booleanValue) ||
                other.booleanValue == booleanValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, booleanValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsDoneValueModelImplCopyWith<_$IsDoneValueModelImpl> get copyWith =>
      __$$IsDoneValueModelImplCopyWithImpl<_$IsDoneValueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IsDoneValueModelImplToJson(
      this,
    );
  }
}

abstract class _IsDoneValueModel implements IsDoneValueModel {
  const factory _IsDoneValueModel({final bool? booleanValue}) =
      _$IsDoneValueModelImpl;

  factory _IsDoneValueModel.fromJson(Map<String, dynamic> json) =
      _$IsDoneValueModelImpl.fromJson;

  @override
  bool? get booleanValue;
  @override
  @JsonKey(ignore: true)
  _$$IsDoneValueModelImplCopyWith<_$IsDoneValueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
