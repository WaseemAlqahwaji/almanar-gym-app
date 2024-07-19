import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:almanar_application/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is VerifiedAccountFailure ||
          current is VerifiedAccountLoading ||
          current is VerifiedAccountSuccess,
      listener: (context, state) {
        print("********************* $state *********************");
        state.whenOrNull(
          initial: () {},
          verifiedAccountLoading: () {
            loadingDialog(context);
          },
          verifiedAccountSuccess: (verifyResponse) {
            context.pushNamed(Routes.homeNotSubscribedLayoutScreen);
          },
          verifiedAccountFailure: (error) {

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
