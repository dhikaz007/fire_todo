// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteAccountModel {

 String? get kind;
/// Create a copy of DeleteAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAccountModelCopyWith<DeleteAccountModel> get copyWith => _$DeleteAccountModelCopyWithImpl<DeleteAccountModel>(this as DeleteAccountModel, _$identity);

  /// Serializes this DeleteAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountModel&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'DeleteAccountModel(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $DeleteAccountModelCopyWith<$Res>  {
  factory $DeleteAccountModelCopyWith(DeleteAccountModel value, $Res Function(DeleteAccountModel) _then) = _$DeleteAccountModelCopyWithImpl;
@useResult
$Res call({
 String? kind
});




}
/// @nodoc
class _$DeleteAccountModelCopyWithImpl<$Res>
    implements $DeleteAccountModelCopyWith<$Res> {
  _$DeleteAccountModelCopyWithImpl(this._self, this._then);

  final DeleteAccountModel _self;
  final $Res Function(DeleteAccountModel) _then;

/// Create a copy of DeleteAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = freezed,}) {
  return _then(_self.copyWith(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteAccountModel].
extension DeleteAccountModelPatterns on DeleteAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteAccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _DeleteAccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteAccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteAccountModel() when $default != null:
return $default(_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kind)  $default,) {final _that = this;
switch (_that) {
case _DeleteAccountModel():
return $default(_that.kind);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kind)?  $default,) {final _that = this;
switch (_that) {
case _DeleteAccountModel() when $default != null:
return $default(_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteAccountModel implements DeleteAccountModel {
  const _DeleteAccountModel({this.kind});
  factory _DeleteAccountModel.fromJson(Map<String, dynamic> json) => _$DeleteAccountModelFromJson(json);

@override final  String? kind;

/// Create a copy of DeleteAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteAccountModelCopyWith<_DeleteAccountModel> get copyWith => __$DeleteAccountModelCopyWithImpl<_DeleteAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAccountModel&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'DeleteAccountModel(kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$DeleteAccountModelCopyWith<$Res> implements $DeleteAccountModelCopyWith<$Res> {
  factory _$DeleteAccountModelCopyWith(_DeleteAccountModel value, $Res Function(_DeleteAccountModel) _then) = __$DeleteAccountModelCopyWithImpl;
@override @useResult
$Res call({
 String? kind
});




}
/// @nodoc
class __$DeleteAccountModelCopyWithImpl<$Res>
    implements _$DeleteAccountModelCopyWith<$Res> {
  __$DeleteAccountModelCopyWithImpl(this._self, this._then);

  final _DeleteAccountModel _self;
  final $Res Function(_DeleteAccountModel) _then;

/// Create a copy of DeleteAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = freezed,}) {
  return _then(_DeleteAccountModel(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
