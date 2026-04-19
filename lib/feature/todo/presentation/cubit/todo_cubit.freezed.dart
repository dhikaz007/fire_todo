// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState()';
  }
}

/// @nodoc
class $TodoStateCopyWith<$Res> {
  $TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}

/// Adds pattern-matching-related methods to [TodoState].
extension TodoStatePatterns on TodoState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Add value)? add,
    TResult Function(_Delete value)? delete,
    TResult Function(_Edit value)? edit,
    TResult Function(_DeleteAll value)? deleteAll,
    TResult Function(_Detail value)? detail,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Add() when add != null:
        return add(_that);
      case _Delete() when delete != null:
        return delete(_that);
      case _Edit() when edit != null:
        return edit(_that);
      case _DeleteAll() when deleteAll != null:
        return deleteAll(_that);
      case _Detail() when detail != null:
        return detail(_that);
      case _Failed() when failed != null:
        return failed(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Add value) add,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Edit value) edit,
    required TResult Function(_DeleteAll value) deleteAll,
    required TResult Function(_Detail value) detail,
    required TResult Function(_Failed value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Add():
        return add(_that);
      case _Delete():
        return delete(_that);
      case _Edit():
        return edit(_that);
      case _DeleteAll():
        return deleteAll(_that);
      case _Detail():
        return detail(_that);
      case _Failed():
        return failed(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Add value)? add,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_DeleteAll value)? deleteAll,
    TResult? Function(_Detail value)? detail,
    TResult? Function(_Failed value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Add() when add != null:
        return add(_that);
      case _Delete() when delete != null:
        return delete(_that);
      case _Edit() when edit != null:
        return edit(_that);
      case _DeleteAll() when deleteAll != null:
        return deleteAll(_that);
      case _Detail() when detail != null:
        return detail(_that);
      case _Failed() when failed != null:
        return failed(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ListTodoModel response)? loaded,
    TResult Function(DocumentModel response)? add,
    TResult Function(String response)? delete,
    TResult Function(DocumentModel response)? edit,
    TResult Function(String response)? deleteAll,
    TResult Function(DocumentModel response)? detail,
    TResult Function(String errorMessage)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.response);
      case _Add() when add != null:
        return add(_that.response);
      case _Delete() when delete != null:
        return delete(_that.response);
      case _Edit() when edit != null:
        return edit(_that.response);
      case _DeleteAll() when deleteAll != null:
        return deleteAll(_that.response);
      case _Detail() when detail != null:
        return detail(_that.response);
      case _Failed() when failed != null:
        return failed(_that.errorMessage);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ListTodoModel response) loaded,
    required TResult Function(DocumentModel response) add,
    required TResult Function(String response) delete,
    required TResult Function(DocumentModel response) edit,
    required TResult Function(String response) deleteAll,
    required TResult Function(DocumentModel response) detail,
    required TResult Function(String errorMessage) failed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(_that.response);
      case _Add():
        return add(_that.response);
      case _Delete():
        return delete(_that.response);
      case _Edit():
        return edit(_that.response);
      case _DeleteAll():
        return deleteAll(_that.response);
      case _Detail():
        return detail(_that.response);
      case _Failed():
        return failed(_that.errorMessage);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ListTodoModel response)? loaded,
    TResult? Function(DocumentModel response)? add,
    TResult? Function(String response)? delete,
    TResult? Function(DocumentModel response)? edit,
    TResult? Function(String response)? deleteAll,
    TResult? Function(DocumentModel response)? detail,
    TResult? Function(String errorMessage)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(_that.response);
      case _Add() when add != null:
        return add(_that.response);
      case _Delete() when delete != null:
        return delete(_that.response);
      case _Edit() when edit != null:
        return edit(_that.response);
      case _DeleteAll() when deleteAll != null:
        return deleteAll(_that.response);
      case _Detail() when detail != null:
        return detail(_that.response);
      case _Failed() when failed != null:
        return failed(_that.errorMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TodoState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.initial()';
  }
}

/// @nodoc

class _Loading implements TodoState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.loading()';
  }
}

/// @nodoc

class _Loaded implements TodoState {
  const _Loaded({this.response = const ListTodoModel()});

  @JsonKey()
  final ListTodoModel response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.loaded(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({ListTodoModel response});

  $ListTodoModelCopyWith<$Res> get response;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_Loaded(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as ListTodoModel,
    ));
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListTodoModelCopyWith<$Res> get response {
    return $ListTodoModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _Add implements TodoState {
  const _Add({this.response = const DocumentModel()});

  @JsonKey()
  final DocumentModel response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCopyWith<_Add> get copyWith =>
      __$AddCopyWithImpl<_Add>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Add &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.add(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$AddCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) _then) =
      __$AddCopyWithImpl;
  @useResult
  $Res call({DocumentModel response});

  $DocumentModelCopyWith<$Res> get response;
}

/// @nodoc
class __$AddCopyWithImpl<$Res> implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(this._self, this._then);

  final _Add _self;
  final $Res Function(_Add) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_Add(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as DocumentModel,
    ));
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentModelCopyWith<$Res> get response {
    return $DocumentModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _Delete implements TodoState {
  const _Delete({this.response = ''});

  @JsonKey()
  final String response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Delete &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.delete(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) =
      __$DeleteCopyWithImpl;
  @useResult
  $Res call({String response});
}

/// @nodoc
class __$DeleteCopyWithImpl<$Res> implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_Delete(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Edit implements TodoState {
  const _Edit({this.response = const DocumentModel()});

  @JsonKey()
  final DocumentModel response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditCopyWith<_Edit> get copyWith =>
      __$EditCopyWithImpl<_Edit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Edit &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.edit(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$EditCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$EditCopyWith(_Edit value, $Res Function(_Edit) _then) =
      __$EditCopyWithImpl;
  @useResult
  $Res call({DocumentModel response});

  $DocumentModelCopyWith<$Res> get response;
}

/// @nodoc
class __$EditCopyWithImpl<$Res> implements _$EditCopyWith<$Res> {
  __$EditCopyWithImpl(this._self, this._then);

  final _Edit _self;
  final $Res Function(_Edit) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_Edit(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as DocumentModel,
    ));
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentModelCopyWith<$Res> get response {
    return $DocumentModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _DeleteAll implements TodoState {
  const _DeleteAll({this.response = ''});

  @JsonKey()
  final String response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteAllCopyWith<_DeleteAll> get copyWith =>
      __$DeleteAllCopyWithImpl<_DeleteAll>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteAll &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.deleteAll(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$DeleteAllCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$DeleteAllCopyWith(
          _DeleteAll value, $Res Function(_DeleteAll) _then) =
      __$DeleteAllCopyWithImpl;
  @useResult
  $Res call({String response});
}

/// @nodoc
class __$DeleteAllCopyWithImpl<$Res> implements _$DeleteAllCopyWith<$Res> {
  __$DeleteAllCopyWithImpl(this._self, this._then);

  final _DeleteAll _self;
  final $Res Function(_DeleteAll) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_DeleteAll(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Detail implements TodoState {
  const _Detail({this.response = const DocumentModel()});

  @JsonKey()
  final DocumentModel response;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailCopyWith<_Detail> get copyWith =>
      __$DetailCopyWithImpl<_Detail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Detail &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @override
  String toString() {
    return 'TodoState.detail(response: $response)';
  }
}

/// @nodoc
abstract mixin class _$DetailCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$DetailCopyWith(_Detail value, $Res Function(_Detail) _then) =
      __$DetailCopyWithImpl;
  @useResult
  $Res call({DocumentModel response});

  $DocumentModelCopyWith<$Res> get response;
}

/// @nodoc
class __$DetailCopyWithImpl<$Res> implements _$DetailCopyWith<$Res> {
  __$DetailCopyWithImpl(this._self, this._then);

  final _Detail _self;
  final $Res Function(_Detail) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? response = null,
  }) {
    return _then(_Detail(
      response: null == response
          ? _self.response
          : response // ignore: cast_nullable_to_non_nullable
              as DocumentModel,
    ));
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DocumentModelCopyWith<$Res> get response {
    return $DocumentModelCopyWith<$Res>(_self.response, (value) {
      return _then(_self.copyWith(response: value));
    });
  }
}

/// @nodoc

class _Failed implements TodoState {
  const _Failed({this.errorMessage = ''});

  @JsonKey()
  final String errorMessage;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailedCopyWith<_Failed> get copyWith =>
      __$FailedCopyWithImpl<_Failed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failed &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'TodoState.failed(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$FailedCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$FailedCopyWith(_Failed value, $Res Function(_Failed) _then) =
      __$FailedCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$FailedCopyWithImpl<$Res> implements _$FailedCopyWith<$Res> {
  __$FailedCopyWithImpl(this._self, this._then);

  final _Failed _self;
  final $Res Function(_Failed) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_Failed(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
