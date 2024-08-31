
import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_state.freezed.dart';
@freezed
class ForgetPasswordState<T> with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.forgetLoading() = ForgetLoading;
  const factory ForgetPasswordState.forgetSuccess(T data) = ForgetSuccess<T>;
  const factory ForgetPasswordState.forgetFailure(String error) = ForgetFailure<T>;
}
