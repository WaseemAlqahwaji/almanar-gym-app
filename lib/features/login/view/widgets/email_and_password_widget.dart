import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/helpers/validation.dart';
import '../../../../config/routes/routes.dart';
import '../../../core/view/widgets/text_form_item.dart';
import '../../logic/login_cubit.dart';

class EmailAndPasswordWidget extends StatelessWidget {
  const EmailAndPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أهلا بعودتك",
                style: TextStyled.font28White400,
              ),
            ),
            KTextForm(
              controller: context.read<LoginCubit>().emailController,
              title: "البريد الالكتروني",
              type: TextInputType.emailAddress,
              validator: (value) {
                return TextFormValidation.emailValidation(value);
              },
            ),
            const Gap(20),
            KTextForm(
              validator: (value) {
                return TextFormValidation.passwordValidation(value);
              },
              controller: context.read<LoginCubit>().passwordController,
              title: "كلمة السر",
              type: TextInputType.visiblePassword,
            ),
            Gap(10.0.h),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  context.pushNamed(Routes.forgetScreen);
                },
                child: Text(
                  "هل نسيت كلمة المرور ؟",
                  style: TextStyled.font14MainColor400underLine.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
