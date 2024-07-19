import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/login/logic/login_cubit.dart';
import 'package:almanar_application/features/login/view/widgets/login_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/helpers/validation.dart';
import '../../../../config/routes/routes.dart';
import '../../../../config/theming/text_style.dart';
import '../../../core/view/widgets/text_form_item.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginCubit>().emailController.text = "waseemalqahwaji123@gmail.com";
    context.read<LoginCubit>().passwordController.text = "tt123456";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const LoginBlocListner(),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0.r),
                  ),
                  child: Image.asset(
                    "assets/images/login_guy.png",
                    fit: BoxFit.fill,
                  )
                ),
                const Spacer(),
                Padding(
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
                              style:
                              TextStyled.font14MainColor400underLine.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: KButton(
                      haveArrow: true,
                      onPressed: () {
                        login(context);
                      },
                      lable: "تسجيل دخول",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState();
    }
  }
}