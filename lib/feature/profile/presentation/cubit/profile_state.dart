part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded(
      {@Default(UserModel()) UserModel response}) = _Loaded;
  const factory ProfileState.failed({@Default('') String errorMessage}) =
      _Failed;
  const factory ProfileState.delete(
      {@Default(DeleteAccountModel()) DeleteAccountModel response}) = _Delete;
  const factory ProfileState.reset(
      {@Default(RequestEmailModel()) RequestEmailModel response}) = _Reset;
}
