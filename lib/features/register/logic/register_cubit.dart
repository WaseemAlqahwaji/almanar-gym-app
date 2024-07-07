import 'package:almanar_application/features/sign_up/data/models/register_requset_body.dart';
import 'package:almanar_application/features/sign_up/data/repo/register_repo.dart';
import 'package:almanar_application/features/sign_up/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(const RegisterState.initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void emitRegisterState() async {
    emit(const RegisterState.registerLoadaing());
    final response = await _registerRepo.register(
      RegisterRequsetBody(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: cPasswordController.text,
      ),
    );
    response.when(success: (registerResponse) {
      emit(RegisterState.registerSuccess(registerResponse));
    }, failure: (error) {
      emit(RegisterState.registerFailure(error.apiErrorModel.message ?? ""));
    });
  }
}
