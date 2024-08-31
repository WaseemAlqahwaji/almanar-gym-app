
import 'package:freezed_annotation/freezed_annotation.dart';
part 'verify_reset_password_code_state.freezed.dart';

@freezed
class VerifyResetPasswordCodeState<T> with _$VerifyResetPasswordCodeState<T> {
  const factory VerifyResetPasswordCodeState.initial() = _Initial;
  const factory VerifyResetPasswordCodeState.verificationResetPasswordCodeLoading() = VerificationResetPasswordCodeLoading;
  const factory VerifyResetPasswordCodeState.verificationResetPasswordCodeSuccess(T data) = VerificationResetPasswordCodeSuccess<T>;
  const factory VerifyResetPasswordCodeState.verificationResetPasswordCodeFailure(String error) = VerificationResetPasswordCodeFailure<T>;
}
