
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_new_password_state.freezed.dart';

@freezed
class EnterNewPasswordState<T> with _$EnterNewPasswordState<T> {
  const factory EnterNewPasswordState.initial() = _Initial;
  const factory EnterNewPasswordState.enterNewPasswordLoading() = EnterNewPasswordLoading;
  const factory EnterNewPasswordState.enterNewPasswordSuccess(T data) = EnterNewPasswordSuccess<T>;
  const factory EnterNewPasswordState.enterNewPasswordFailure(String error) = EnterNewPasswordFailure<T>;
}
