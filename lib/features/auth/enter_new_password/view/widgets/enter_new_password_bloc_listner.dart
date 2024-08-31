import 'package:almanar_application/features/auth/enter_new_password/cubit/enter_new_password_cubit.dart';
import 'package:almanar_application/features/auth/enter_new_password/cubit/enter_new_password_state.dart';
import 'package:almanar_application/features/auth/enter_new_password/data/model/enter_new_password_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../config/theming/theme.dart';
import '../../../../core/view/widgets/error_dialog.dart';
import '../../../../core/view/widgets/loading_dialog.dart';

class EnterNewPasswordBlocListner extends StatelessWidget {
  const EnterNewPasswordBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnterNewPasswordCubit, EnterNewPasswordState>(
      listenWhen: (previous, current) =>
          current is EnterNewPasswordFailure ||
          current is EnterNewPasswordLoading ||
          current is EnterNewPasswordSuccess,
      listener: (context, state) {
        state.whenOrNull(
          initial: () {},
          enterNewPasswordLoading: () {
            loadingDialog(context);
          },
          enterNewPasswordSuccess: (data) {
            Fluttertoast.showToast(
              msg: (data as EnterNewPasswordReponse).message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: KTheme.mainColor.withOpacity(.4),
              textColor: Colors.white,
            );
            Navigator.pop(context); // pop the dialog
            Navigator.pop(context); // pop the EnterPasswordScreen
            Navigator.pop(context); // pop the ForgetPasswordScreen
          },
          enterNewPasswordFailure: (error) {
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
