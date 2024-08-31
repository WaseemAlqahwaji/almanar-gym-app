import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/login/logic/login_cubit.dart';
import 'package:almanar_application/features/login/view/widgets/email_and_password_widget.dart';
import 'package:almanar_application/features/login/view/widgets/login_image.dart';
import 'package:almanar_application/features/login/view/widgets/login_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const LoginBlocListner(),
                const LoginImage(),
                const Spacer(),
                const EmailAndPasswordWidget(),
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
