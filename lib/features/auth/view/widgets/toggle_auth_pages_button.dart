import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';

class ToggleAuthPagesTextButton extends StatefulWidget {
  final String lable;
  final bool isSelected;

  const ToggleAuthPagesTextButton({
    super.key,
    required this.lable,
    required this.isSelected,
  });

  @override
  State<ToggleAuthPagesTextButton> createState() =>
      _ToggleAuthPagesTextButtonState();
}

class _ToggleAuthPagesTextButtonState extends State<ToggleAuthPagesTextButton> {
  Color selectorColor = KTheme.mainColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.lable,
              style: widget.isSelected ? TextStyled.font16White700 : TextStyled.font16White700.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(5.h),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 5,
          width: 60.w,
          color: widget.isSelected ? KTheme.mainColor : Colors.transparent,
        ),
      ],
    );
  }
}
