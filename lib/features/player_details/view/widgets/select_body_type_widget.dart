import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';


class SelectBodyTypeWidget extends StatefulWidget {
  final void Function() onTap;
  final String imagePath;
  final String bodyType;
  final bool isSelected;

  const SelectBodyTypeWidget({
    super.key,
    required this.onTap,
    required this.bodyType,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  State<SelectBodyTypeWidget> createState() => _SelectBodyTypeWidgetState();
}

class _SelectBodyTypeWidgetState extends State<SelectBodyTypeWidget> {
  double userDetailsWidgetPadding = 20.0.w;
  double itemSize = 0.0;

  @override
  Widget build(BuildContext context) {
    setItemSize(context);
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: itemSize,
            width: itemSize,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.0.r),
              border: Border.all(
                color: widget.isSelected ? KTheme.mainColor : Colors.white.withOpacity(.3),
                width: widget.isSelected ? 2.0 : 1.0,
              ),
            ),
            child: Image.asset(widget.imagePath),
          ),
        ),
        Gap(10.0.h),
        Text(
          widget.bodyType,
          style: TextStyled.font15WhiteBold,
        ),
      ],
    );
  }

  void setItemSize(BuildContext context) {
    itemSize = (MediaQuery.of(context).size.width / 2) -
        userDetailsWidgetPadding -
        20.0.w;
  }
}
