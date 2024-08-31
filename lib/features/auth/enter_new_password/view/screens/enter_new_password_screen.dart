import 'package:almanar_application/features/auth/enter_new_password/cubit/enter_new_password_cubit.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../config/theming/text_style.dart';
import '../widgets/enter_new_password_bloc_listner.dart';
import '../widgets/enter_new_password_forms.dart';

class EnterNewPasswordScreen extends StatelessWidget {
  const EnterNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const EnterNewPasswordBlocListner(),
                  const Align(
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
                  const EnterNewPasswordForms(),
                  const Spacer(),
                  KButton(
                    onPressed: () {
                      onSend(context);
                    },
                    lable: "تأكيد",
                    haveArrow: false,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSend(BuildContext context) {
    if (context
        .read<EnterNewPasswordCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<EnterNewPasswordCubit>().emitEnterNewPassword();
    }
  }
}
