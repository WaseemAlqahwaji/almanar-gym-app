import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theming/text_style.dart';

class KButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String lable;
  final double? width;
  final bool haveArrow;
  final FontWeight? lableWeight ;

  const KButton({
    super.key,
    required this.onPressed,
    required this.lable,
    this.width,
    required this.haveArrow,
    this.lableWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.0.h,
      child: haveArrow == false
          ? ElevatedButton(
              onPressed: onPressed,
              child: Text(
                lable,
                style: TextStyled.font18Black600
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    lable,
                    style: TextStyled.font18Black600,
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.black,
                  )
                ],
              ),
            ),
    );
  }
}
