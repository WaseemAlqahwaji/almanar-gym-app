import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';
import '../../../core/view/widgets/error_dialog.dart';
import '../../../core/view/widgets/loading_dialog.dart';
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
              error: error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}
