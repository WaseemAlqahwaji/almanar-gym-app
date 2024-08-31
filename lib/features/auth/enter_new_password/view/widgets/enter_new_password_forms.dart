import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/helpers/validation.dart';
import '../../../../core/view/widgets/text_form_item.dart';
import '../../cubit/enter_new_password_cubit.dart';

class EnterNewPasswordForms extends StatefulWidget {
  const EnterNewPasswordForms({super.key});

  @override
  State<EnterNewPasswordForms> createState() => _EnterNewPasswordFormsState();
}

class _EnterNewPasswordFormsState extends State<EnterNewPasswordForms> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EnterNewPasswordCubit>().formKey,
        child: Column(
      children: [
        KTextForm(
          controller:
              context.read<EnterNewPasswordCubit>().newPasswordController,
          title: "كلمة المرور",
          validator: (value) {
            return TextFormValidation.passwordValidation(value);
          },
          type: TextInputType.visiblePassword,
        ),
        Gap(30.0.h),
        KTextForm(
          controller:
              context.read<EnterNewPasswordCubit>().cNewPasswordController,
          title: "تأكيد كلمة المرور",
          validator: (value) {
            return validateConfirmation(value);
          },
          type: TextInputType.visiblePassword,
        ),
      ],
    ));
  }

  String? validateConfirmation(String? value) {
    if (TextFormValidation.passwordValidation(value) == null) {
      return TextFormValidation.passwordCheck(
        password:
            context.read<EnterNewPasswordCubit>().newPasswordController.text,
        cPassword:
            context.read<EnterNewPasswordCubit>().cNewPasswordController.text,
      );
    } else {
      return TextFormValidation.passwordValidation(value);
    }
  }
}
