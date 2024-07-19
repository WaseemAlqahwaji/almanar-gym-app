import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/routes/routes.dart';
import '../../logic/login_cubit.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccess ||
          current is LoginFailure ||
          current is LoginLoading,
      listener: (context, state) {
        state.whenOrNull(
          initial: () {},
          loginLoading: () {
            loadingDialog(context);
          },
          loginSuccess: (loginResponse) {
            Navigator.pop(context);
            context.pushReplacementNamed(Routes.homeNotSubscribedLayoutScreen);
          },
          loginFailure: (error) {
            Navigator.pop(context);
            errorDialog(
              context,
              errorMessage: error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> errorDialog(BuildContext context,{required String errorMessage}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                errorMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: SpinKitSpinningLines(
            color: KTheme.mainColor,
          ),
        ),
      ),
    );
  }
}
