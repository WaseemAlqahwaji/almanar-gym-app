import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_state.dart';
import 'package:almanar_application/features/auth/forget_password/data/models/forget_password_body_request.dart';
import 'package:almanar_application/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordCubit(this._forgetPasswordRepo) : super(const ForgetPasswordState.initial());
  TextEditingController emailController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }

  void emitForgetPassword() async {
    emit(const ForgetPasswordState.forgetLoading());
    final response = await _forgetPasswordRepo.forgetPassword(
      ForgetPasswordBodyRequest(email: emailController.text)
    );

    response.whenOrNull(success: (forgetPasswordResponse) async {
      emit(ForgetPasswordState.forgetSuccess(forgetPasswordResponse));
    }, failure: (error) {
      emit(ForgetPasswordState.forgetFailure(error.apiErrorModel.message ?? ""));
    });
  }
}
