import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../config/helpers/validation.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../config/theming/text_style.dart';
import '../../../../core/view/widgets/button_item.dart';
import '../../../../core/view/widgets/text_form_item.dart';

// TODO : keyboard make widgets go up

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100.0.r)),
                      child: Image.asset(
                        "assets/images/register_guy.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Form(
                        key: formKey,
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
                              controller: emailController,
                              title: "البريد الالكتروني",
                              validator: (value) {
                                return TextFormValidation.emailValidation(
                                    value);
                              },
                              type: TextInputType.emailAddress,
                            ),
                            Gap(20.0.h),
                            KTextForm(
                              validator: (value) {
                                return TextFormValidation.passwordValidation(
                                    value);
                              },
                              controller: passwordController,
                              title: "كلمة السر",
                              type: TextInputType.visiblePassword,
                            ),
                            Gap(20.0.h),
                            KTextForm(
                              validator: (value) {
                                if (TextFormValidation.passwordValidation(
                                        value) ==
                                    null) {
                                  return TextFormValidation.passwordCheck(
                                    password: passwordController.text,
                                    cPassword: cPasswordController.text,
                                  );
                                } else {
                                  return TextFormValidation.passwordValidation(
                                      value);
                                }
                              },
                              controller: cPasswordController,
                              type: TextInputType.visiblePassword,
                              title: "تأكيد كلمة المرور",
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
                            // if (formKey.currentState!.validate()) {
                            //   print("gooooood");
                            // }
                            context.pushNamedAndRemoveUntil(
                              Routes.userDetailsLayoutScreen,
                              predicate: (_) => false,
                            ); // TODO : it should be replacement
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
}
