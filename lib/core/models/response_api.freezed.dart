// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResponseAPI<T> {

 T? get data;
/// Create a copy of ResponseAPI
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseAPICopyWith<T, ResponseAPI<T>> get copyWith => _$ResponseAPICopyWithImpl<T, ResponseAPI<T>>(this as ResponseAPI<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResponseAPI<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResponseAPI<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class $ResponseAPICopyWith<T,$Res>  {
  factory $ResponseAPICopyWith(ResponseAPI<T> value, $Res Function(ResponseAPI<T>) _then) = _$ResponseAPICopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$ResponseAPICopyWithImpl<T,$Res>
    implements $ResponseAPICopyWith<T, $Res> {
  _$ResponseAPICopyWithImpl(this._self, this._then);

  final ResponseAPI<T> _self;
  final $Res Function(ResponseAPI<T>) _then;

/// Create a copy of ResponseAPI
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [ResponseAPI].
extension ResponseAPIPatterns<T> on ResponseAPI<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResponseAPI<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResponseAPI() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResponseAPI<T> value)  $default,){
final _that = this;
switch (_that) {
case _ResponseAPI():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResponseAPI<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ResponseAPI() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResponseAPI() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T? data)  $default,) {final _that = this;
switch (_that) {
case _ResponseAPI():
return $default(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T? data)?  $default,) {final _that = this;
switch (_that) {
case _ResponseAPI() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _ResponseAPI<T> implements ResponseAPI<T> {
  const _ResponseAPI({this.data});
  

@override final  T? data;

/// Create a copy of ResponseAPI
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseAPICopyWith<T, _ResponseAPI<T>> get copyWith => __$ResponseAPICopyWithImpl<T, _ResponseAPI<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseAPI<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ResponseAPI<$T>(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ResponseAPICopyWith<T,$Res> implements $ResponseAPICopyWith<T, $Res> {
  factory _$ResponseAPICopyWith(_ResponseAPI<T> value, $Res Function(_ResponseAPI<T>) _then) = __$ResponseAPICopyWithImpl;
@override @useResult
$Res call({
 T? data
});




}
/// @nodoc
class __$ResponseAPICopyWithImpl<T,$Res>
    implements _$ResponseAPICopyWith<T, $Res> {
  __$ResponseAPICopyWithImpl(this._self, this._then);

  final _ResponseAPI<T> _self;
  final $Res Function(_ResponseAPI<T>) _then;

/// Create a copy of ResponseAPI
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_ResponseAPI<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
