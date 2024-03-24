import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/helpers/hex_color.dart';
import '../../../config/routes/routes.dart';
import '../../../config/theming/text_style.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/landing_guy.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            color: HexColor("#2A3036"),
            child: Column(
              children: [
                KButton(
                  onPressed: () {
                    context.pushReplacementNamed(
                      Routes.authLayoutScreen,
                      arguments: {
                        "isLogin": true,
                      },
                    );
                  },
                  haveArrow: false,
                  lable: "تسجيل دخول",
                  width: double.infinity,
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Text(
                        "دخول كزائر",
                        style: TextStyled.font14MainColor400underLine,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushReplacementNamed(
                          Routes.authLayoutScreen,
                          arguments: {
                            "isLogin": false,
                          },
                        );
                      },
                      child: Text(
                        "إنشاء حساب",
                        style: TextStyled.font14MainColor400underLine,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
