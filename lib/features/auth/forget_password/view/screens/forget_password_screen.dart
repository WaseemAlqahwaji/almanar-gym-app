import 'package:almanar_application/config/di/di.dart';
import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/core/view/widgets/text_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/helpers/validation.dart';
import '../widgets/forget_password_bloc_listner.dart';
import '../widgets/forget_password_header_text.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    getIt.resetLazySingleton(instance: getIt<ForgetPasswordCubit>());
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ForgetPasswordCubit>().emailController.text =
        "waseemalqahwaji123@gmail.com";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            const ForgetPasswordBlocListner(),
            const HeaderText(),
            const Spacer(
              flex: 3,
            ),
            Form(
              key: formKey,
              child: KTextForm(
                controller: context.read<ForgetPasswordCubit>().emailController,
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
                  context.read<ForgetPasswordCubit>().emitForgetPassword();
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
