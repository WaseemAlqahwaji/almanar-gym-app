import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/sign_up/logic/register_cubit.dart';
import 'package:almanar_application/features/sign_up/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterSuccess ||
          current is RegisterFailure ||
          current is RegisterLoadaing,
      listener: (context, state) {
        state.when(
          initial: () {},
          registerLoadaing: () {
            loadingDialog(context);
          },
          registerSuccess: (signupResponse) {
            Navigator.pop(context);
            context.pushNamed(Routes.verificationCodeScreen);
          },
          registerFailure: (error) {
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
