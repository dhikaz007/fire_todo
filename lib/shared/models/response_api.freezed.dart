// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseAPI<T> {
  T? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResponseAPICopyWith<T, ResponseAPI<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseAPICopyWith<T, $Res> {
  factory $ResponseAPICopyWith(
          ResponseAPI<T> value, $Res Function(ResponseAPI<T>) then) =
      _$ResponseAPICopyWithImpl<T, $Res, ResponseAPI<T>>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class _$ResponseAPICopyWithImpl<T, $Res, $Val extends ResponseAPI<T>>
    implements $ResponseAPICopyWith<T, $Res> {
  _$ResponseAPICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseAPIImplCopyWith<T, $Res>
    implements $ResponseAPICopyWith<T, $Res> {
  factory _$$ResponseAPIImplCopyWith(_$ResponseAPIImpl<T> value,
          $Res Function(_$ResponseAPIImpl<T>) then) =
      __$$ResponseAPIImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResponseAPIImplCopyWithImpl<T, $Res>
    extends _$ResponseAPICopyWithImpl<T, $Res, _$ResponseAPIImpl<T>>
    implements _$$ResponseAPIImplCopyWith<T, $Res> {
  __$$ResponseAPIImplCopyWithImpl(
      _$ResponseAPIImpl<T> _value, $Res Function(_$ResponseAPIImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResponseAPIImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResponseAPIImpl<T> implements _ResponseAPI<T> {
  const _$ResponseAPIImpl({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'ResponseAPI<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseAPIImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseAPIImplCopyWith<T, _$ResponseAPIImpl<T>> get copyWith =>
      __$$ResponseAPIImplCopyWithImpl<T, _$ResponseAPIImpl<T>>(
          this, _$identity);
}

abstract class _ResponseAPI<T> implements ResponseAPI<T> {
  const factory _ResponseAPI({final T? data}) = _$ResponseAPIImpl<T>;

  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResponseAPIImplCopyWith<T, _$ResponseAPIImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
