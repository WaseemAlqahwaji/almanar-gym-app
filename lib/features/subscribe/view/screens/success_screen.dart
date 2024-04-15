import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SuccessSubscriptionScreen extends StatefulWidget {
  const SuccessSubscriptionScreen({super.key});

  @override
  State<SuccessSubscriptionScreen> createState() =>
      _SuccessSubscriptionScreenState();
}

class _SuccessSubscriptionScreenState extends State<SuccessSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: null,
                    fillColor: MaterialStateProperty.all(KTheme.mainColor),
                  ),
                  Expanded(
                    child: Text(
                      "تم ارسال طلبك",
                      style: TextStyled.font24White600,
                    ),
                  ),
                ],
              ),
              Gap(20.0.h),
              Padding(
                padding: EdgeInsets.all(13.0.h),
                child: Text(
                  "سيتواصل معك الفريق المختص لاتمام عملية الدفع والاشتراك",
                  style: TextStyled.font16White400,
                ),
              ),
              const Spacer(),
              KButton(
                onPressed: () {
          
                },
                lable: "تم",
                haveArrow: false,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
