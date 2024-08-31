import 'package:almanar_application/config/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/view/widgets/back_button.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: KBackButton(),
        ),
        Gap(20.0.h),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "هل نسيت كلمة السر؟",
                style: TextStyled.font24White600,
              ),
              Gap(10.0.h),
              Text(
                "أدخل المعلومات الخاصة بك أدناه أو\n تسجيل الدخول باستخدام حساب آخر",
                style: TextStyled.font16Grey400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
