// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestEmailModel {

 String? get kind; String? get email;
/// Create a copy of RequestEmailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestEmailModelCopyWith<RequestEmailModel> get copyWith => _$RequestEmailModelCopyWithImpl<RequestEmailModel>(this as RequestEmailModel, _$identity);

  /// Serializes this RequestEmailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestEmailModel&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,email);

@override
String toString() {
  return 'RequestEmailModel(kind: $kind, email: $email)';
}


}

/// @nodoc
abstract mixin class $RequestEmailModelCopyWith<$Res>  {
  factory $RequestEmailModelCopyWith(RequestEmailModel value, $Res Function(RequestEmailModel) _then) = _$RequestEmailModelCopyWithImpl;
@useResult
$Res call({
 String? kind, String? email
});




}
/// @nodoc
class _$RequestEmailModelCopyWithImpl<$Res>
    implements $RequestEmailModelCopyWith<$Res> {
  _$RequestEmailModelCopyWithImpl(this._self, this._then);

  final RequestEmailModel _self;
  final $Res Function(RequestEmailModel) _then;

/// Create a copy of RequestEmailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestEmailModel].
extension RequestEmailModelPatterns on RequestEmailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestEmailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestEmailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestEmailModel value)  $default,){
final _that = this;
switch (_that) {
case _RequestEmailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestEmailModel value)?  $default,){
final _that = this;
switch (_that) {
case _RequestEmailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? kind,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestEmailModel() when $default != null:
return $default(_that.kind,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? kind,  String? email)  $default,) {final _that = this;
switch (_that) {
case _RequestEmailModel():
return $default(_that.kind,_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? kind,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _RequestEmailModel() when $default != null:
return $default(_that.kind,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestEmailModel implements RequestEmailModel {
  const _RequestEmailModel({this.kind, this.email});
  factory _RequestEmailModel.fromJson(Map<String, dynamic> json) => _$RequestEmailModelFromJson(json);

@override final  String? kind;
@override final  String? email;

/// Create a copy of RequestEmailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestEmailModelCopyWith<_RequestEmailModel> get copyWith => __$RequestEmailModelCopyWithImpl<_RequestEmailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestEmailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestEmailModel&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,email);

@override
String toString() {
  return 'RequestEmailModel(kind: $kind, email: $email)';
}


}

/// @nodoc
abstract mixin class _$RequestEmailModelCopyWith<$Res> implements $RequestEmailModelCopyWith<$Res> {
  factory _$RequestEmailModelCopyWith(_RequestEmailModel value, $Res Function(_RequestEmailModel) _then) = __$RequestEmailModelCopyWithImpl;
@override @useResult
$Res call({
 String? kind, String? email
});




}
/// @nodoc
class __$RequestEmailModelCopyWithImpl<$Res>
    implements _$RequestEmailModelCopyWith<$Res> {
  __$RequestEmailModelCopyWithImpl(this._self, this._then);

  final _RequestEmailModel _self;
  final $Res Function(_RequestEmailModel) _then;

/// Create a copy of RequestEmailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = freezed,Object? email = freezed,}) {
  return _then(_RequestEmailModel(
kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
