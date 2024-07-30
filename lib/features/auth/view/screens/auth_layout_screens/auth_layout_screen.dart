import 'package:almanar_application/features/register/view/screens/register_screen.dart';
import 'package:almanar_application/features/player_details/view/widgets/toggle_auth_pages_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../login/view/screens/login_screen.dart';

class AuthLayoutScreen extends StatefulWidget {
  final bool isLogin;

   const AuthLayoutScreen({
    required this.isLogin,
    super.key,
  });

  @override
  State<AuthLayoutScreen> createState() => _AuthLayoutScreenState();
}

class _AuthLayoutScreenState extends State<AuthLayoutScreen> {
  static int initialPage = 0;

  bool isLoginState = false;

  @override
  void initState() {
    if (widget.isLogin){
      isLoginState = widget.isLogin;
      initialPage = 1;
    }
    super.initState();
  }

  static PageController controller = PageController(
    initialPage: initialPage,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                isLoginState = !isLoginState;
              });
            },
            children: const [
              SignUpScreen(),
              LoginScreen(),
            ],
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleAuthPagesTextButton(
                  lable: "إنشاء حساب",
                  isSelected: !isLoginState,
                ),
                Gap(15.0.w),
                ToggleAuthPagesTextButton(
                  lable: "تسجيل دخول",
                  isSelected: isLoginState,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
