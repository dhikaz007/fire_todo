// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteAccountModel _$DeleteAccountModelFromJson(Map<String, dynamic> json) {
  return _DeleteAccountModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteAccountModel {
  String? get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteAccountModelCopyWith<DeleteAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAccountModelCopyWith<$Res> {
  factory $DeleteAccountModelCopyWith(
          DeleteAccountModel value, $Res Function(DeleteAccountModel) then) =
      _$DeleteAccountModelCopyWithImpl<$Res, DeleteAccountModel>;
  @useResult
  $Res call({String? kind});
}

/// @nodoc
class _$DeleteAccountModelCopyWithImpl<$Res, $Val extends DeleteAccountModel>
    implements $DeleteAccountModelCopyWith<$Res> {
  _$DeleteAccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
  }) {
    return _then(_value.copyWith(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAccountModelImplCopyWith<$Res>
    implements $DeleteAccountModelCopyWith<$Res> {
  factory _$$DeleteAccountModelImplCopyWith(_$DeleteAccountModelImpl value,
          $Res Function(_$DeleteAccountModelImpl) then) =
      __$$DeleteAccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? kind});
}

/// @nodoc
class __$$DeleteAccountModelImplCopyWithImpl<$Res>
    extends _$DeleteAccountModelCopyWithImpl<$Res, _$DeleteAccountModelImpl>
    implements _$$DeleteAccountModelImplCopyWith<$Res> {
  __$$DeleteAccountModelImplCopyWithImpl(_$DeleteAccountModelImpl _value,
      $Res Function(_$DeleteAccountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
  }) {
    return _then(_$DeleteAccountModelImpl(
      kind: freezed == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteAccountModelImpl implements _DeleteAccountModel {
  const _$DeleteAccountModelImpl({this.kind});

  factory _$DeleteAccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteAccountModelImplFromJson(json);

  @override
  final String? kind;

  @override
  String toString() {
    return 'DeleteAccountModel(kind: $kind)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountModelImpl &&
            (identical(other.kind, kind) || other.kind == kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAccountModelImplCopyWith<_$DeleteAccountModelImpl> get copyWith =>
      __$$DeleteAccountModelImplCopyWithImpl<_$DeleteAccountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteAccountModelImplToJson(
      this,
    );
  }
}

abstract class _DeleteAccountModel implements DeleteAccountModel {
  const factory _DeleteAccountModel({final String? kind}) =
      _$DeleteAccountModelImpl;

  factory _DeleteAccountModel.fromJson(Map<String, dynamic> json) =
      _$DeleteAccountModelImpl.fromJson;

  @override
  String? get kind;
  @override
  @JsonKey(ignore: true)
  _$$DeleteAccountModelImplCopyWith<_$DeleteAccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
