import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/core/view/widgets/text_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/helpers/validation.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../config/theming/text_style.dart';
import '../../../../core/view/widgets/back_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController forgetPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    forgetPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    forgetPasswordController.text = "@gmail.com";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.h),
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
                    "هل نسيت كلمة السر؟",
                    style: TextStyled.font24White600,
                  ),
                  Gap(10.0.h),
                  Text(
                    "أدخل المعلومات الخاصة بك أدناه أو\n تسجيل الدخول باستخدام حساب آخر",
                    style: TextStyled.font16Grey400,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Form(
              key: formKey,
              child: KTextForm(
                controller: forgetPasswordController,
                type: TextInputType.emailAddress,
                title: "البريد الالكتروني",
                validator: (value) {
                  return TextFormValidation.emailValidation(value);
                },
              ),
            ),
            const Spacer(
              flex: 7,
            ),
            KButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.pushNamed(Routes.verificationCodeScreen);
                }
              },
              lable: "إرسال",
              width: double.infinity,
              haveArrow: false,
            ),
          ],
        ),
      ),
    );
  }
}