import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/auth/verify_reset_password_code/cubit/verify_reset_password_code_cubit.dart';
import 'package:almanar_application/features/auth/verify_reset_password_code/view/widgets/header_text_verify_reset_password.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';

import '../widgets/verify_reset_password_bloc_listner.dart';

class VerifyResetPasswordScreen extends StatefulWidget {
  const VerifyResetPasswordScreen({super.key});

  @override
  State<VerifyResetPasswordScreen> createState() =>
      _VerifyResetPasswordScreen();
}

class _VerifyResetPasswordScreen extends State<VerifyResetPasswordScreen> {
  bool verificationIsNotComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          children: [
            const VerifyResetPasswordBlocListner(),
            const Align(
              alignment: Alignment.centerRight,
              child: KBackButton(),
            ),
            const HeaderTextVerifyResetPassword(),
            Gap(20.0.h),
            Directionality(
              textDirection: TextDirection.ltr,
              child: VerificationCode(
                autofocus: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0.sp,
                ),
                underlineColor: KTheme.mainColor,
                underlineWidth: 1.3,
                onCompleted: (value) {
                  context
                      .read<VerifyResetPasswordCodeCubit>()
                      .verificationValue = value;
                  FocusScope.of(context).unfocus();
                },
                onEditing: (onEditing) {
                  if (onEditing) {
                    context
                        .read<VerifyResetPasswordCodeCubit>()
                        .verificationValue = null;
                  }
                },
                length: 6,
              ),
            ),
            Gap(30.0.h),
            ConditionalBuilder(
              condition: verificationIsNotComplete,
              builder: (context) => Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "يجب أن تكون كل الحقول ممتلئة",
                  style: TextStyled.font16Red400,
                ),
              ),
              fallback: (context) => Container(),
            ),
            const Spacer(),
            KButton(
              onPressed: () {
                onConfirm();
              },
              lable: "تأكيد",
              width: double.infinity,
              haveArrow: false,
            ),
          ],
        ),
      ),
    );
  }

  void onConfirm() {
    if (context.read<VerifyResetPasswordCodeCubit>().verificationValue != null) {
      context.read<VerifyResetPasswordCodeCubit>().emitVerifyResetPasswordState();
    } else {
      setState(() {
        verificationIsNotComplete = true;
      });
    }
  }
}
