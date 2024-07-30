import 'package:almanar_application/features/login/data/models/login_requset_body.dart';
import 'package:almanar_application/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/helpers/constants.dart';
import '../../../config/helpers/shared_pref.dart';
import '../../../config/networking/dio_factory.dart';
import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {

  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

    void emitLoginState() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequsetBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );
    response.whenOrNull(success: (loginResponse) async {
      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        loginResponse.token,
      );
      DioFactory.setTokenIntoHeader(loginResponse.token);
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (error) {
      emit(LoginState.loginFailure(error.apiErrorModel.message ?? ""));
    });
  }
}
