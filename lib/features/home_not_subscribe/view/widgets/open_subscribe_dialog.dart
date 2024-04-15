import 'dart:ui';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SubscribeDialog extends StatelessWidget {
  final void Function() onConfirmPressed;
  final void Function() onCancel;
  final String confirmLable;
  final String cancelLable;
  final String imagePath;
  final String dialogTitle;
  final String dialogDescription;

  const SubscribeDialog({
    super.key,
    required this.imagePath,
    required this.onConfirmPressed,
    required this.onCancel,
    required this.confirmLable,
    required this.cancelLable,
    required this.dialogTitle,
    required this.dialogDescription,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: KTheme.greyButtonsColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.0.w),
                  child: Column(
                    children: [
                      Text(
                        dialogTitle,
                        style: TextStyled.font16White700,
                      ),
                      Gap(10.0.h),
                      Text(
                        dialogDescription,
                        style: TextStyled.font14MainColor400underLine.copyWith(
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Gap(10.0.h),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: KButton(
                width: double.infinity,
                onPressed: onConfirmPressed,
                lable: confirmLable,
                haveArrow: false,
              ),
            ),
            TextButton(
              onPressed: onCancel,
              child: Text(cancelLable),
            ),
          ],
        ),
      ),
    );
  }
}
