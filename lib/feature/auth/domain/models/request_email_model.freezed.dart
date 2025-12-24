// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_email_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestEmailModel _$RequestEmailModelFromJson(Map<String, dynamic> json) {
  return _RequestEmailModel.fromJson(json);
}

/// @nodoc
mixin _$RequestEmailModel {
  String? get kind => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestEmailModelCopyWith<RequestEmailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestEmailModelCopyWith<$Res> {
  factory $RequestEmailModelCopyWith(
          RequestEmailModel value, $Res Function(RequestEmailModel) then) =
      _$RequestEmailModelCopyWithImpl<$Res, RequestEmailModel>;
  @useResult
  $Res call({String? kind, String? email});
}

/// @nodoc
class _$RequestEmailModelCopyWithImpl<$Res, $Val extends RequestEmailModel>
    implements $RequestEmailModelCopyWith<$Res> {
  _$RequestEmailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestEmailModelImplCopyWith<$Res>
    implements $RequestEmailModelCopyWith<$Res> {
  factory _$$RequestEmailModelImplCopyWith(_$RequestEmailModelImpl value,
          $Res Function(_$RequestEmailModelImpl) then) =
      __$$RequestEmailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind, String? email});
}

/// @nodoc
class __$$RequestEmailModelImplCopyWithImpl<$Res>
    extends _$RequestEmailModelCopyWithImpl<$Res, _$RequestEmailModelImpl>
    implements _$$RequestEmailModelImplCopyWith<$Res> {
  __$$RequestEmailModelImplCopyWithImpl(_$RequestEmailModelImpl _value,
      $Res Function(_$RequestEmailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? email = freezed,
  }) {
    return _then(_$RequestEmailModelImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestEmailModelImpl implements _RequestEmailModel {
  const _$RequestEmailModelImpl({this.kind, this.email});

  factory _$RequestEmailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestEmailModelImplFromJson(json);

  @override
  final String? kind;
  @override
  final String? email;

  @override
  String toString() {
    return 'RequestEmailModel(kind: $kind, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestEmailModelImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestEmailModelImplCopyWith<_$RequestEmailModelImpl> get copyWith =>
      __$$RequestEmailModelImplCopyWithImpl<_$RequestEmailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestEmailModelImplToJson(
      this,
    );
  }
}

abstract class _RequestEmailModel implements RequestEmailModel {
  const factory _RequestEmailModel({final String? kind, final String? email}) =
      _$RequestEmailModelImpl;

  factory _RequestEmailModel.fromJson(Map<String, dynamic> json) =
      _$RequestEmailModelImpl.fromJson;

  @override
  String? get kind;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$RequestEmailModelImplCopyWith<_$RequestEmailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
