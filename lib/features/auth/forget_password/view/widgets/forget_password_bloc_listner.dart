import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../core/view/widgets/error_dialog.dart';
import '../../../../core/view/widgets/loading_dialog.dart';

class ForgetPasswordBlocListner extends StatelessWidget {
  const ForgetPasswordBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is ForgetLoading ||
          current is ForgetSuccess ||
          current is ForgetFailure,
      listener: (context, state) {
        state.whenOrNull(
          initial: () {},
          forgetLoading: () {
            loadingDialog(context);
          },
          forgetFailure: (String error) {
            Navigator.pop(context);
            errorDialog(context, error: error);
          },
          forgetSuccess: (error) {
            Navigator.pop(context);
            context.pushNamed(Routes.verificationCodeScreen);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}