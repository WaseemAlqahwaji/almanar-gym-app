import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:gap/gap.dart';

import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';

class RegisterVerificationCodeScreen extends StatefulWidget {
  const RegisterVerificationCodeScreen({super.key});

  @override
  State<RegisterVerificationCodeScreen> createState() => _RegisterVerificationCodeScreen();
}

class _RegisterVerificationCodeScreen extends State<RegisterVerificationCodeScreen> {
  String? verificationValue;
  bool verificationIsNotComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          children: [
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
                autofocus: true,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28.0.sp,
                ),
                underlineColor: KTheme.mainColor,
                underlineWidth: 1.3,
                onCompleted: (value) {
                  verificationValue = value;
                  FocusScope.of(context).unfocus();
                },
                onEditing: (onEditing) {
                  if (onEditing) {
                    verificationValue = null;
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
                if (verificationValue != null) {
                  // context.pushNamed(Routes.enterNewPasswordScreen);
                } else {
                  setState(() {
                    verificationIsNotComplete = true;
                  });
                }
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
}
