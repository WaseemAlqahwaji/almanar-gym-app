import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(100.0.r),
      ),
      child: Image.asset(
        "assets/images/login_guy.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
