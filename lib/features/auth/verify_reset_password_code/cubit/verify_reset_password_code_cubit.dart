import 'package:almanar_application/config/networking/dio_factory.dart';
import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/verify_reset_password_request_body.dart';
import '../data/repo/verify_reset_password_code_repo.dart';
import 'verify_reset_password_code_state.dart';

class VerifyResetPasswordCodeCubit extends Cubit<VerifyResetPasswordCodeState> {
  final VerifyResetPasswordCodeRepo _verifyResetPasswordCodeRepo;
  final ForgetPasswordCubit _forgetPasswordCubit;

  VerifyResetPasswordCodeCubit(this._verifyResetPasswordCodeRepo, this._forgetPasswordCubit) : super(const VerifyResetPasswordCodeState.initial());
    String? verificationValue;

  void emitVerifyResetPasswordState() async {
    emit(const VerifyResetPasswordCodeState
        .verificationResetPasswordCodeLoading());
    final response = await _verifyResetPasswordCodeRepo.verifyResetPasswordCode(
      VerifyResetPasswordRequestBody(
        code: verificationValue!,
        email: _forgetPasswordCubit.emailController.text,
      ),
    );
    response.whenOrNull(success: (response) {
      DioFactory.setTokenIntoHeader(response.token);
      emit(VerifyResetPasswordCodeState.verificationResetPasswordCodeSuccess(response));
    }, failure: (error) {
      emit(VerifyResetPasswordCodeState.verificationResetPasswordCodeFailure(
          error.apiErrorModel.message ?? ""));
    });
  }
}
