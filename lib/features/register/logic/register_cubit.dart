import 'package:almanar_application/config/helpers/constants.dart';
import 'package:almanar_application/config/helpers/shared_pref.dart';
import 'package:almanar_application/config/networking/dio_factory.dart';
import 'package:almanar_application/features/register/data/models/register_requset_body.dart';
import 'package:almanar_application/features/register/data/models/verify_request_body.dart';
import 'package:almanar_application/features/register/data/repo/register_repo.dart';
import 'package:almanar_application/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  String verificationValue = "";

  void emitRegisterState() async {
    emit(const RegisterState.registerLoading());
    final response = await _registerRepo.register(
      RegisterRequsetBody(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: cPasswordController.text,
      ),
    );
    response.whenOrNull(success: (registerResponse) async {
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        registerResponse.token,
      );
      DioFactory.setTokenIntoHeader(registerResponse.token);
      emit(RegisterState.registerSuccess(registerResponse));
    }, failure: (error) {
      emit(RegisterState.registerFailure(error.apiErrorModel.message ?? ""));
    });
  }

  void emitVerifyAccountState() async {
    emit(const RegisterState.verifiedAccountLoading());
    final response = await _registerRepo.verifyAccount(
      VerifyRequestBody(code: verificationValue),
    );
    response.whenOrNull(success: (response) {
      emit(RegisterState.verifiedAccountSuccess(response));
    }, failure: (error) {
      emit(RegisterState.verifiedAccountFailure(
          error.apiErrorModel.message ?? ""));
    });
  }
}
