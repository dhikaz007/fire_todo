// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListTodoModel {

 List<DocumentModel>? get documents;
/// Create a copy of ListTodoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTodoModelCopyWith<ListTodoModel> get copyWith => _$ListTodoModelCopyWithImpl<ListTodoModel>(this as ListTodoModel, _$identity);

  /// Serializes this ListTodoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListTodoModel&&const DeepCollectionEquality().equals(other.documents, documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(documents));

@override
String toString() {
  return 'ListTodoModel(documents: $documents)';
}


}

/// @nodoc
abstract mixin class $ListTodoModelCopyWith<$Res>  {
  factory $ListTodoModelCopyWith(ListTodoModel value, $Res Function(ListTodoModel) _then) = _$ListTodoModelCopyWithImpl;
@useResult
$Res call({
 List<DocumentModel>? documents
});




}
/// @nodoc
class _$ListTodoModelCopyWithImpl<$Res>
    implements $ListTodoModelCopyWith<$Res> {
  _$ListTodoModelCopyWithImpl(this._self, this._then);

  final ListTodoModel _self;
  final $Res Function(ListTodoModel) _then;

/// Create a copy of ListTodoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documents = freezed,}) {
  return _then(_self.copyWith(
documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListTodoModel].
extension ListTodoModelPatterns on ListTodoModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListTodoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListTodoModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListTodoModel value)  $default,){
final _that = this;
switch (_that) {
case _ListTodoModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListTodoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ListTodoModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DocumentModel>? documents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListTodoModel() when $default != null:
return $default(_that.documents);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DocumentModel>? documents)  $default,) {final _that = this;
switch (_that) {
case _ListTodoModel():
return $default(_that.documents);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DocumentModel>? documents)?  $default,) {final _that = this;
switch (_that) {
case _ListTodoModel() when $default != null:
return $default(_that.documents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListTodoModel implements ListTodoModel {
  const _ListTodoModel({final  List<DocumentModel>? documents}): _documents = documents;
  factory _ListTodoModel.fromJson(Map<String, dynamic> json) => _$ListTodoModelFromJson(json);

 final  List<DocumentModel>? _documents;
@override List<DocumentModel>? get documents {
  final value = _documents;
  if (value == null) return null;
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ListTodoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListTodoModelCopyWith<_ListTodoModel> get copyWith => __$ListTodoModelCopyWithImpl<_ListTodoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListTodoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListTodoModel&&const DeepCollectionEquality().equals(other._documents, _documents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_documents));

@override
String toString() {
  return 'ListTodoModel(documents: $documents)';
}


}

/// @nodoc
abstract mixin class _$ListTodoModelCopyWith<$Res> implements $ListTodoModelCopyWith<$Res> {
  factory _$ListTodoModelCopyWith(_ListTodoModel value, $Res Function(_ListTodoModel) _then) = __$ListTodoModelCopyWithImpl;
@override @useResult
$Res call({
 List<DocumentModel>? documents
});




}
/// @nodoc
class __$ListTodoModelCopyWithImpl<$Res>
    implements _$ListTodoModelCopyWith<$Res> {
  __$ListTodoModelCopyWithImpl(this._self, this._then);

  final _ListTodoModel _self;
  final $Res Function(_ListTodoModel) _then;

/// Create a copy of ListTodoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documents = freezed,}) {
  return _then(_ListTodoModel(
documents: freezed == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentModel>?,
  ));
}


}


/// @nodoc
mixin _$DocumentModel {

 String? get name; FieldsModel? get fields; DateTime? get createTime; DateTime? get updateTime;
/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentModelCopyWith<DocumentModel> get copyWith => _$DocumentModelCopyWithImpl<DocumentModel>(this as DocumentModel, _$identity);

  /// Serializes this DocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fields, fields) || other.fields == fields)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fields,createTime,updateTime);

@override
String toString() {
  return 'DocumentModel(name: $name, fields: $fields, createTime: $createTime, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class $DocumentModelCopyWith<$Res>  {
  factory $DocumentModelCopyWith(DocumentModel value, $Res Function(DocumentModel) _then) = _$DocumentModelCopyWithImpl;
@useResult
$Res call({
 String? name, FieldsModel? fields, DateTime? createTime, DateTime? updateTime
});


$FieldsModelCopyWith<$Res>? get fields;

}
/// @nodoc
class _$DocumentModelCopyWithImpl<$Res>
    implements $DocumentModelCopyWith<$Res> {
  _$DocumentModelCopyWithImpl(this._self, this._then);

  final DocumentModel _self;
  final $Res Function(DocumentModel) _then;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? fields = freezed,Object? createTime = freezed,Object? updateTime = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as FieldsModel?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldsModelCopyWith<$Res>? get fields {
    if (_self.fields == null) {
    return null;
  }

  return $FieldsModelCopyWith<$Res>(_self.fields!, (value) {
    return _then(_self.copyWith(fields: value));
  });
}
}


/// Adds pattern-matching-related methods to [DocumentModel].
extension DocumentModelPatterns on DocumentModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _DocumentModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  FieldsModel? fields,  DateTime? createTime,  DateTime? updateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that.name,_that.fields,_that.createTime,_that.updateTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  FieldsModel? fields,  DateTime? createTime,  DateTime? updateTime)  $default,) {final _that = this;
switch (_that) {
case _DocumentModel():
return $default(_that.name,_that.fields,_that.createTime,_that.updateTime);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  FieldsModel? fields,  DateTime? createTime,  DateTime? updateTime)?  $default,) {final _that = this;
switch (_that) {
case _DocumentModel() when $default != null:
return $default(_that.name,_that.fields,_that.createTime,_that.updateTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentModel implements DocumentModel {
  const _DocumentModel({this.name, this.fields, this.createTime, this.updateTime});
  factory _DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);

@override final  String? name;
@override final  FieldsModel? fields;
@override final  DateTime? createTime;
@override final  DateTime? updateTime;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentModelCopyWith<_DocumentModel> get copyWith => __$DocumentModelCopyWithImpl<_DocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fields, fields) || other.fields == fields)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,fields,createTime,updateTime);

@override
String toString() {
  return 'DocumentModel(name: $name, fields: $fields, createTime: $createTime, updateTime: $updateTime)';
}


}

/// @nodoc
abstract mixin class _$DocumentModelCopyWith<$Res> implements $DocumentModelCopyWith<$Res> {
  factory _$DocumentModelCopyWith(_DocumentModel value, $Res Function(_DocumentModel) _then) = __$DocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, FieldsModel? fields, DateTime? createTime, DateTime? updateTime
});


@override $FieldsModelCopyWith<$Res>? get fields;

}
/// @nodoc
class __$DocumentModelCopyWithImpl<$Res>
    implements _$DocumentModelCopyWith<$Res> {
  __$DocumentModelCopyWithImpl(this._self, this._then);

  final _DocumentModel _self;
  final $Res Function(_DocumentModel) _then;

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? fields = freezed,Object? createTime = freezed,Object? updateTime = freezed,}) {
  return _then(_DocumentModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as FieldsModel?,createTime: freezed == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,updateTime: freezed == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of DocumentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FieldsModelCopyWith<$Res>? get fields {
    if (_self.fields == null) {
    return null;
  }

  return $FieldsModelCopyWith<$Res>(_self.fields!, (value) {
    return _then(_self.copyWith(fields: value));
  });
}
}


/// @nodoc
mixin _$FieldsModel {

 DescriptionValueModel? get title; DescriptionValueModel? get description; IsDoneValueModel? get isDone; DueDateValueModel? get dueDate;
/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldsModelCopyWith<FieldsModel> get copyWith => _$FieldsModelCopyWithImpl<FieldsModel>(this as FieldsModel, _$identity);

  /// Serializes this FieldsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldsModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,isDone,dueDate);

@override
String toString() {
  return 'FieldsModel(title: $title, description: $description, isDone: $isDone, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $FieldsModelCopyWith<$Res>  {
  factory $FieldsModelCopyWith(FieldsModel value, $Res Function(FieldsModel) _then) = _$FieldsModelCopyWithImpl;
@useResult
$Res call({
 DescriptionValueModel? title, DescriptionValueModel? description, IsDoneValueModel? isDone, DueDateValueModel? dueDate
});


$DescriptionValueModelCopyWith<$Res>? get title;$DescriptionValueModelCopyWith<$Res>? get description;$IsDoneValueModelCopyWith<$Res>? get isDone;$DueDateValueModelCopyWith<$Res>? get dueDate;

}
/// @nodoc
class _$FieldsModelCopyWithImpl<$Res>
    implements $FieldsModelCopyWith<$Res> {
  _$FieldsModelCopyWithImpl(this._self, this._then);

  final FieldsModel _self;
  final $Res Function(FieldsModel) _then;

/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? isDone = freezed,Object? dueDate = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DescriptionValueModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DescriptionValueModel?,isDone: freezed == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as IsDoneValueModel?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DueDateValueModel?,
  ));
}
/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DescriptionValueModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $DescriptionValueModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DescriptionValueModelCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $DescriptionValueModelCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsDoneValueModelCopyWith<$Res>? get isDone {
    if (_self.isDone == null) {
    return null;
  }

  return $IsDoneValueModelCopyWith<$Res>(_self.isDone!, (value) {
    return _then(_self.copyWith(isDone: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DueDateValueModelCopyWith<$Res>? get dueDate {
    if (_self.dueDate == null) {
    return null;
  }

  return $DueDateValueModelCopyWith<$Res>(_self.dueDate!, (value) {
    return _then(_self.copyWith(dueDate: value));
  });
}
}


/// Adds pattern-matching-related methods to [FieldsModel].
extension FieldsModelPatterns on FieldsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldsModel value)  $default,){
final _that = this;
switch (_that) {
case _FieldsModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FieldsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DescriptionValueModel? title,  DescriptionValueModel? description,  IsDoneValueModel? isDone,  DueDateValueModel? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldsModel() when $default != null:
return $default(_that.title,_that.description,_that.isDone,_that.dueDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DescriptionValueModel? title,  DescriptionValueModel? description,  IsDoneValueModel? isDone,  DueDateValueModel? dueDate)  $default,) {final _that = this;
switch (_that) {
case _FieldsModel():
return $default(_that.title,_that.description,_that.isDone,_that.dueDate);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DescriptionValueModel? title,  DescriptionValueModel? description,  IsDoneValueModel? isDone,  DueDateValueModel? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _FieldsModel() when $default != null:
return $default(_that.title,_that.description,_that.isDone,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldsModel implements FieldsModel {
  const _FieldsModel({this.title, this.description, this.isDone, this.dueDate});
  factory _FieldsModel.fromJson(Map<String, dynamic> json) => _$FieldsModelFromJson(json);

@override final  DescriptionValueModel? title;
@override final  DescriptionValueModel? description;
@override final  IsDoneValueModel? isDone;
@override final  DueDateValueModel? dueDate;

/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldsModelCopyWith<_FieldsModel> get copyWith => __$FieldsModelCopyWithImpl<_FieldsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldsModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,isDone,dueDate);

@override
String toString() {
  return 'FieldsModel(title: $title, description: $description, isDone: $isDone, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$FieldsModelCopyWith<$Res> implements $FieldsModelCopyWith<$Res> {
  factory _$FieldsModelCopyWith(_FieldsModel value, $Res Function(_FieldsModel) _then) = __$FieldsModelCopyWithImpl;
@override @useResult
$Res call({
 DescriptionValueModel? title, DescriptionValueModel? description, IsDoneValueModel? isDone, DueDateValueModel? dueDate
});


@override $DescriptionValueModelCopyWith<$Res>? get title;@override $DescriptionValueModelCopyWith<$Res>? get description;@override $IsDoneValueModelCopyWith<$Res>? get isDone;@override $DueDateValueModelCopyWith<$Res>? get dueDate;

}
/// @nodoc
class __$FieldsModelCopyWithImpl<$Res>
    implements _$FieldsModelCopyWith<$Res> {
  __$FieldsModelCopyWithImpl(this._self, this._then);

  final _FieldsModel _self;
  final $Res Function(_FieldsModel) _then;

/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? isDone = freezed,Object? dueDate = freezed,}) {
  return _then(_FieldsModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DescriptionValueModel?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DescriptionValueModel?,isDone: freezed == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as IsDoneValueModel?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DueDateValueModel?,
  ));
}

/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DescriptionValueModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $DescriptionValueModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DescriptionValueModelCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $DescriptionValueModelCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IsDoneValueModelCopyWith<$Res>? get isDone {
    if (_self.isDone == null) {
    return null;
  }

  return $IsDoneValueModelCopyWith<$Res>(_self.isDone!, (value) {
    return _then(_self.copyWith(isDone: value));
  });
}/// Create a copy of FieldsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DueDateValueModelCopyWith<$Res>? get dueDate {
    if (_self.dueDate == null) {
    return null;
  }

  return $DueDateValueModelCopyWith<$Res>(_self.dueDate!, (value) {
    return _then(_self.copyWith(dueDate: value));
  });
}
}


/// @nodoc
mixin _$DueDateValueModel {

@FirestoreDateTimeConverter() DateTime? get timestampValue;
/// Create a copy of DueDateValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DueDateValueModelCopyWith<DueDateValueModel> get copyWith => _$DueDateValueModelCopyWithImpl<DueDateValueModel>(this as DueDateValueModel, _$identity);

  /// Serializes this DueDateValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DueDateValueModel&&(identical(other.timestampValue, timestampValue) || other.timestampValue == timestampValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestampValue);

@override
String toString() {
  return 'DueDateValueModel(timestampValue: $timestampValue)';
}


}

/// @nodoc
abstract mixin class $DueDateValueModelCopyWith<$Res>  {
  factory $DueDateValueModelCopyWith(DueDateValueModel value, $Res Function(DueDateValueModel) _then) = _$DueDateValueModelCopyWithImpl;
@useResult
$Res call({
@FirestoreDateTimeConverter() DateTime? timestampValue
});




}
/// @nodoc
class _$DueDateValueModelCopyWithImpl<$Res>
    implements $DueDateValueModelCopyWith<$Res> {
  _$DueDateValueModelCopyWithImpl(this._self, this._then);

  final DueDateValueModel _self;
  final $Res Function(DueDateValueModel) _then;

/// Create a copy of DueDateValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestampValue = freezed,}) {
  return _then(_self.copyWith(
timestampValue: freezed == timestampValue ? _self.timestampValue : timestampValue // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DueDateValueModel].
extension DueDateValueModelPatterns on DueDateValueModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DueDateValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DueDateValueModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DueDateValueModel value)  $default,){
final _that = this;
switch (_that) {
case _DueDateValueModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DueDateValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _DueDateValueModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@FirestoreDateTimeConverter()  DateTime? timestampValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DueDateValueModel() when $default != null:
return $default(_that.timestampValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@FirestoreDateTimeConverter()  DateTime? timestampValue)  $default,) {final _that = this;
switch (_that) {
case _DueDateValueModel():
return $default(_that.timestampValue);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@FirestoreDateTimeConverter()  DateTime? timestampValue)?  $default,) {final _that = this;
switch (_that) {
case _DueDateValueModel() when $default != null:
return $default(_that.timestampValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DueDateValueModel implements DueDateValueModel {
  const _DueDateValueModel({@FirestoreDateTimeConverter() this.timestampValue});
  factory _DueDateValueModel.fromJson(Map<String, dynamic> json) => _$DueDateValueModelFromJson(json);

@override@FirestoreDateTimeConverter() final  DateTime? timestampValue;

/// Create a copy of DueDateValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DueDateValueModelCopyWith<_DueDateValueModel> get copyWith => __$DueDateValueModelCopyWithImpl<_DueDateValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DueDateValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DueDateValueModel&&(identical(other.timestampValue, timestampValue) || other.timestampValue == timestampValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestampValue);

@override
String toString() {
  return 'DueDateValueModel(timestampValue: $timestampValue)';
}


}

/// @nodoc
abstract mixin class _$DueDateValueModelCopyWith<$Res> implements $DueDateValueModelCopyWith<$Res> {
  factory _$DueDateValueModelCopyWith(_DueDateValueModel value, $Res Function(_DueDateValueModel) _then) = __$DueDateValueModelCopyWithImpl;
@override @useResult
$Res call({
@FirestoreDateTimeConverter() DateTime? timestampValue
});




}
/// @nodoc
class __$DueDateValueModelCopyWithImpl<$Res>
    implements _$DueDateValueModelCopyWith<$Res> {
  __$DueDateValueModelCopyWithImpl(this._self, this._then);

  final _DueDateValueModel _self;
  final $Res Function(_DueDateValueModel) _then;

/// Create a copy of DueDateValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestampValue = freezed,}) {
  return _then(_DueDateValueModel(
timestampValue: freezed == timestampValue ? _self.timestampValue : timestampValue // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DescriptionValueModel {

 String? get stringValue;
/// Create a copy of DescriptionValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DescriptionValueModelCopyWith<DescriptionValueModel> get copyWith => _$DescriptionValueModelCopyWithImpl<DescriptionValueModel>(this as DescriptionValueModel, _$identity);

  /// Serializes this DescriptionValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DescriptionValueModel&&(identical(other.stringValue, stringValue) || other.stringValue == stringValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stringValue);

@override
String toString() {
  return 'DescriptionValueModel(stringValue: $stringValue)';
}


}

/// @nodoc
abstract mixin class $DescriptionValueModelCopyWith<$Res>  {
  factory $DescriptionValueModelCopyWith(DescriptionValueModel value, $Res Function(DescriptionValueModel) _then) = _$DescriptionValueModelCopyWithImpl;
@useResult
$Res call({
 String? stringValue
});




}
/// @nodoc
class _$DescriptionValueModelCopyWithImpl<$Res>
    implements $DescriptionValueModelCopyWith<$Res> {
  _$DescriptionValueModelCopyWithImpl(this._self, this._then);

  final DescriptionValueModel _self;
  final $Res Function(DescriptionValueModel) _then;

/// Create a copy of DescriptionValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stringValue = freezed,}) {
  return _then(_self.copyWith(
stringValue: freezed == stringValue ? _self.stringValue : stringValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DescriptionValueModel].
extension DescriptionValueModelPatterns on DescriptionValueModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DescriptionValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DescriptionValueModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DescriptionValueModel value)  $default,){
final _that = this;
switch (_that) {
case _DescriptionValueModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DescriptionValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _DescriptionValueModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? stringValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DescriptionValueModel() when $default != null:
return $default(_that.stringValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? stringValue)  $default,) {final _that = this;
switch (_that) {
case _DescriptionValueModel():
return $default(_that.stringValue);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? stringValue)?  $default,) {final _that = this;
switch (_that) {
case _DescriptionValueModel() when $default != null:
return $default(_that.stringValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DescriptionValueModel implements DescriptionValueModel {
  const _DescriptionValueModel({this.stringValue});
  factory _DescriptionValueModel.fromJson(Map<String, dynamic> json) => _$DescriptionValueModelFromJson(json);

@override final  String? stringValue;

/// Create a copy of DescriptionValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DescriptionValueModelCopyWith<_DescriptionValueModel> get copyWith => __$DescriptionValueModelCopyWithImpl<_DescriptionValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DescriptionValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DescriptionValueModel&&(identical(other.stringValue, stringValue) || other.stringValue == stringValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stringValue);

@override
String toString() {
  return 'DescriptionValueModel(stringValue: $stringValue)';
}


}

/// @nodoc
abstract mixin class _$DescriptionValueModelCopyWith<$Res> implements $DescriptionValueModelCopyWith<$Res> {
  factory _$DescriptionValueModelCopyWith(_DescriptionValueModel value, $Res Function(_DescriptionValueModel) _then) = __$DescriptionValueModelCopyWithImpl;
@override @useResult
$Res call({
 String? stringValue
});




}
/// @nodoc
class __$DescriptionValueModelCopyWithImpl<$Res>
    implements _$DescriptionValueModelCopyWith<$Res> {
  __$DescriptionValueModelCopyWithImpl(this._self, this._then);

  final _DescriptionValueModel _self;
  final $Res Function(_DescriptionValueModel) _then;

/// Create a copy of DescriptionValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stringValue = freezed,}) {
  return _then(_DescriptionValueModel(
stringValue: freezed == stringValue ? _self.stringValue : stringValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IsDoneValueModel {

 bool? get booleanValue;
/// Create a copy of IsDoneValueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsDoneValueModelCopyWith<IsDoneValueModel> get copyWith => _$IsDoneValueModelCopyWithImpl<IsDoneValueModel>(this as IsDoneValueModel, _$identity);

  /// Serializes this IsDoneValueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsDoneValueModel&&(identical(other.booleanValue, booleanValue) || other.booleanValue == booleanValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,booleanValue);

@override
String toString() {
  return 'IsDoneValueModel(booleanValue: $booleanValue)';
}


}

/// @nodoc
abstract mixin class $IsDoneValueModelCopyWith<$Res>  {
  factory $IsDoneValueModelCopyWith(IsDoneValueModel value, $Res Function(IsDoneValueModel) _then) = _$IsDoneValueModelCopyWithImpl;
@useResult
$Res call({
 bool? booleanValue
});




}
/// @nodoc
class _$IsDoneValueModelCopyWithImpl<$Res>
    implements $IsDoneValueModelCopyWith<$Res> {
  _$IsDoneValueModelCopyWithImpl(this._self, this._then);

  final IsDoneValueModel _self;
  final $Res Function(IsDoneValueModel) _then;

/// Create a copy of IsDoneValueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? booleanValue = freezed,}) {
  return _then(_self.copyWith(
booleanValue: freezed == booleanValue ? _self.booleanValue : booleanValue // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [IsDoneValueModel].
extension IsDoneValueModelPatterns on IsDoneValueModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IsDoneValueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsDoneValueModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IsDoneValueModel value)  $default,){
final _that = this;
switch (_that) {
case _IsDoneValueModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IsDoneValueModel value)?  $default,){
final _that = this;
switch (_that) {
case _IsDoneValueModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? booleanValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsDoneValueModel() when $default != null:
return $default(_that.booleanValue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? booleanValue)  $default,) {final _that = this;
switch (_that) {
case _IsDoneValueModel():
return $default(_that.booleanValue);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? booleanValue)?  $default,) {final _that = this;
switch (_that) {
case _IsDoneValueModel() when $default != null:
return $default(_that.booleanValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IsDoneValueModel implements IsDoneValueModel {
  const _IsDoneValueModel({this.booleanValue});
  factory _IsDoneValueModel.fromJson(Map<String, dynamic> json) => _$IsDoneValueModelFromJson(json);

@override final  bool? booleanValue;

/// Create a copy of IsDoneValueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsDoneValueModelCopyWith<_IsDoneValueModel> get copyWith => __$IsDoneValueModelCopyWithImpl<_IsDoneValueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsDoneValueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsDoneValueModel&&(identical(other.booleanValue, booleanValue) || other.booleanValue == booleanValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,booleanValue);

@override
String toString() {
  return 'IsDoneValueModel(booleanValue: $booleanValue)';
}


}

/// @nodoc
abstract mixin class _$IsDoneValueModelCopyWith<$Res> implements $IsDoneValueModelCopyWith<$Res> {
  factory _$IsDoneValueModelCopyWith(_IsDoneValueModel value, $Res Function(_IsDoneValueModel) _then) = __$IsDoneValueModelCopyWithImpl;
@override @useResult
$Res call({
 bool? booleanValue
});




}
/// @nodoc
class __$IsDoneValueModelCopyWithImpl<$Res>
    implements _$IsDoneValueModelCopyWith<$Res> {
  __$IsDoneValueModelCopyWithImpl(this._self, this._then);

  final _IsDoneValueModel _self;
  final $Res Function(_IsDoneValueModel) _then;

/// Create a copy of IsDoneValueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? booleanValue = freezed,}) {
  return _then(_IsDoneValueModel(
booleanValue: freezed == booleanValue ? _self.booleanValue : booleanValue // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
