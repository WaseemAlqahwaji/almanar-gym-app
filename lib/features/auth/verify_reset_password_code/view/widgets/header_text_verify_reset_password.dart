import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/theming/text_style.dart';

class HeaderTextVerifyResetPassword extends StatelessWidget {
  const HeaderTextVerifyResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "تحقق",
                    style: TextStyled.font24White600,
                  ),
                  Gap(10.0.h),
                  Text(
                    "تحقق من بريدك الالكتروني. لقد أرسلنا لك رقم التعريف الشخصي على بريدك الإلكتروني",
                    style: TextStyled.font16Grey400,
                  ),
                ],
              ),
            ),
      ],
    );
  }
}