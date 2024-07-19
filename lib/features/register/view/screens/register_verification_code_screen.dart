import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:almanar_application/features/register/view/widgets/verification_register_bloc_listner.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';

import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';

class RegisterVerificationCodeScreen extends StatefulWidget {
  const RegisterVerificationCodeScreen({super.key});

  @override
  State<RegisterVerificationCodeScreen> createState() =>
      _RegisterVerificationCodeScreen();
}

class _RegisterVerificationCodeScreen
    extends State<RegisterVerificationCodeScreen> {
  bool isUserTyping = true, firstTimeBeforeVerification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          children: [
            const VerificationBlocListener(),
            const Align(
              alignment: Alignment.centerRight,
              child: KBackButton(),
            ),
            Gap(20.0.h),
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "تحقق",
                    style: TextStyled.font24White600,
                  ),
                  Gap(10.0.h),
                  Text(
                    "تحقق من بريدك الالكتروني. لقد أرسلنا لك رقم التعريف الشخصي على بريدك الإلكتروني",
                    style: TextStyled.font16Grey400,
                  ),
                ],
              ),
            ),
            Gap(30.0.h),
            Directionality(
              textDirection: TextDirection.ltr,
              child: VerificationCode(
                onEditing: (isTyping) {
                  isUserTyping = isTyping;
                  print(isTyping);
                },
                autofocus: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0.sp,
                ),
                underlineColor: KTheme.mainColor,
                underlineWidth: 1.3,
                onCompleted: (value) {
                  context.read<RegisterCubit>().verificationValue = value;
                  print(context.read<RegisterCubit>().verificationValue);
                  FocusScope.of(context).unfocus();
                },
                length: 6,
              ),
            ),
            Gap(10.0),
            // KButton(
            //   onPressed: () {},
            //   lable: "kdgk",
            //   haveArrow: false,
            // ),
            Gap(30.0.h),
            ConditionalBuilder(
              condition: firstTimeBeforeVerification,
              builder: (context) => Container(),
              fallback: (context) => Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "يجب أن تكون كل الحقول ممتلئة",
                  style: TextStyled.font16Red400,
                ),
              ),
            ),
            const Spacer(),
            KButton(
              onPressed: () {
                onSubmitVerification(context);
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

  void onSubmitVerification(BuildContext context) {
    if (isUserTyping) {
      setState(() {
        firstTimeBeforeVerification = false;
      });
    } else {
      context.read<RegisterCubit>().emitVerifyAccountState();
    }
  }
}
