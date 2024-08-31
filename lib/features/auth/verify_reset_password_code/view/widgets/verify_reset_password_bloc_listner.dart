import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/auth/verify_reset_password_code/cubit/verify_reset_password_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../core/view/widgets/error_dialog.dart';
import '../../../../core/view/widgets/loading_dialog.dart';
import '../../cubit/verify_reset_password_code_state.dart';

class VerifyResetPasswordBlocListner extends StatelessWidget {
  const VerifyResetPasswordBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyResetPasswordCodeCubit, VerifyResetPasswordCodeState>(
      listenWhen: (previous, current) =>
          current is VerificationResetPasswordCodeSuccess ||
          current is VerificationResetPasswordCodeLoading ||
          current is VerificationResetPasswordCodeFailure,
      listener: (context, state) {
        state.whenOrNull(
          initial: () {},
          verificationResetPasswordCodeLoading: () {
            loadingDialog(context);
          },
          verificationResetPasswordCodeSuccess: (loginResponse) {
            Navigator.pop(context);
            context.pushReplacementNamed(Routes.enterNewPasswordScreen);
          },
          verificationResetPasswordCodeFailure: (error) {
            Navigator.pop(context);
            errorDialog(
              context,
              error: error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}