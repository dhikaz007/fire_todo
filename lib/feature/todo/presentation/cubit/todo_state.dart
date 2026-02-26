part of 'todo_cubit.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = _Initial;
  const factory TodoState.loading() = _Loading;
  const factory TodoState.loaded(
      {@Default(ListTodoModel()) ListTodoModel response}) = _Loaded;
  const factory TodoState.add(
      {@Default(DocumentModel()) DocumentModel response}) = _Add;
  const factory TodoState.delete({@Default('') String response}) = _Delete;
  const factory TodoState.edit(
      {@Default(DocumentModel()) DocumentModel response}) = _Edit;
  const factory TodoState.deleteAll({@Default('') String response}) =
      _DeleteAll;
  const factory TodoState.detail(
      {@Default(DocumentModel()) DocumentModel response}) = _Detail;
  const factory TodoState.failed({@Default('') String errorMessage}) = _Failed;
}

