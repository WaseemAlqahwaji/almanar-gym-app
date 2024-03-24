import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';

class BodyTypeWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const BodyTypeWidget({
    super.key,
    required this.isSelected,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.0.r,
      backgroundColor: isSelected ? KTheme.mainColor : KTheme.greyButtonsColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 50.0.r,
            color: isSelected ? Colors.black : Colors.white,
          ),
          Text(
            icon == Icons.male ? "ذكر" : "أنثى",
            style: isSelected
                ? TextStyled.font16White700.copyWith(
              color: Colors.black,
            )
                : TextStyled.font16White700,
          ),
        ],
      ),
    );
  }
}
