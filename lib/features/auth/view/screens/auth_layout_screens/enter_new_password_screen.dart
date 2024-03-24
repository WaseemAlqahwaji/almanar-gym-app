import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/core/view/widgets/text_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/helpers/validation.dart';
import '../../../../../config/theming/text_style.dart';


class EnterNewPasswordScreen extends StatefulWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  State<EnterNewPasswordScreen> createState() => _EnterNewPasswordScreenState();
}

class _EnterNewPasswordScreenState extends State<EnterNewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    newPasswordController.dispose();
    cNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: KBackButton(),
                    ),
                    Gap(20.0.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "أدخل كلمة السر الجديدة",
                        style: TextStyled.font24White600,
                      ),
                    ),
                    Gap(30.0.h),
                    KTextForm(
                      controller: newPasswordController,
                      title: "كلمة المرور",
                      validator: (value) {
                        return TextFormValidation.passwordValidation(value);
                      },
                      type: TextInputType.visiblePassword,
                    ),
                    Gap(30.0.h),
                    KTextForm(
                      controller: cNewPasswordController,
                      title: "تأكيد كلمة المرور",
                      validator: (value) {
                        if (TextFormValidation.passwordValidation(value) ==
                            null) {
                          return TextFormValidation.passwordCheck(
                            password: newPasswordController.text,
                            cPassword: cNewPasswordController.text,
                          );
                        } else {
                          return TextFormValidation.passwordValidation(value);
                        }
                      },
                      type: TextInputType.visiblePassword,
                    ),
                    const Spacer(),
                    KButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("gg");
                        }
                      },
                      lable: "تأكيد",
                      haveArrow: false,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
