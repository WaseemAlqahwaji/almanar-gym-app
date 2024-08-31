import 'package:almanar_application/features/auth/enter_new_password/data/model/enter_new_password_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/enter_new_password_repo.dart';
import 'enter_new_password_state.dart';

class EnterNewPasswordCubit extends Cubit<EnterNewPasswordState> {
  final EnterNewPasswordRepo _enterNewPasswordRepo;
  EnterNewPasswordCubit(this._enterNewPasswordRepo)
      : super(const EnterNewPasswordState.initial());

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void emitEnterNewPassword() async {
    emit(const EnterNewPasswordState.enterNewPasswordLoading());
    final response = await _enterNewPasswordRepo.enterNewPassword(
      EnterNewPasswordRequestBody(
        password: newPasswordController.text,
        confirmPassword: cNewPasswordController.text,
      ),
    );
    response.when(success: (data) {
      emit(EnterNewPasswordState.enterNewPasswordSuccess(data));
    }, failure: (error) {
      emit(EnterNewPasswordState.enterNewPasswordFailure(
          error.apiErrorModel.message ?? ""));
    });
  }
}
