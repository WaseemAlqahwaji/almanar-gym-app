import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theming/theme.dart';


Container pointerDivider({required double width}) {
  return Container(
    color: KTheme.mainColor,
    width: width.w,
    height: 3.0.h,
  );
}
