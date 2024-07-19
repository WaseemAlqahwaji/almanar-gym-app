import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/helpers/shared_pref.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:almanar_application/features/register/view/widgets/bloc_listner_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../config/helpers/validation.dart';
import '../../../../config/theming/text_style.dart';
import '../../../core/view/widgets/button_item.dart';
import '../../../core/view/widgets/text_form_item.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<RegisterCubit>().emailController.text =
        "waseemalqahwaji123@gmail.com";
    context.read<RegisterCubit>().passwordController.text = "tt123456";
    context.read<RegisterCubit>().cPasswordController.text = "tt123456";
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, cons) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: cons.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SignupBlocListener(),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100.0.r),
                      ),
                      child: Image.asset(
                        "assets/images/register_guy.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Form(
                        key: context.read<RegisterCubit>().formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "إنشاء حساب",
                                style: TextStyled.font28White400,
                              ),
                            ),
                            KTextForm(
                              controller:
                                  context.read<RegisterCubit>().emailController,
                              title: "البريد الالكتروني",
                              validator: (value) {
                                return TextFormValidation.emailValidation(
                                  value,
                                );
                              },
                              type: TextInputType.emailAddress,
                            ),
                            Gap(20.0.h),
                            KTextForm(
                              validator: (value) {
                                return TextFormValidation.passwordValidation(
                                  value,
                                );
                              },
                              controller: context
                                  .read<RegisterCubit>()
                                  .passwordController,
                              title: "كلمة السر",
                              type: TextInputType.visiblePassword,
                            ),
                            Gap(20.0.h),
                            KTextForm(
                              validator: (value) {
                                return confirm(value);
                              },
                              controller: context
                                  .read<RegisterCubit>()
                                  .cPasswordController,
                              type: TextInputType.visiblePassword,
                              title: "تأكيد كلمة المرور",
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(10.0),
                    KButton(
                      onPressed: () async {},
                      lable: "kdgk",
                      haveArrow: false,
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.all(20.0.h),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: KButton(
                          haveArrow: true,
                          onPressed: () {
                             validateSignUp(context);
                            // context.pushNamed(Routes.registerVerificationCodeScreen);
                          },
                          lable: "متابعة",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> errorDialog(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateSignUp(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterState();
    }
  }

  String? confirm(String? value) {
    if (TextFormValidation.passwordValidation(value) == null) {
      return TextFormValidation.passwordCheck(
        password: context.read<RegisterCubit>().passwordController.text,
        cPassword: context.read<RegisterCubit>().cPasswordController.text,
      );
    } else {
      return TextFormValidation.passwordValidation(
        value,
      );
    }
  }
}
