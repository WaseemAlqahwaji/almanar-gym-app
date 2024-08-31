import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../config/theming/theme.dart';

Future<dynamic> loadingDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => PopScope(
      canPop: false,
      child: Center(
        child: SpinKitSpinningLines(
          color: KTheme.mainColor,
        ),
      ),
    ),
  );
}

  Future<dynamic> errorDialog(
    BuildContext context, {
    required String errorMessage,
  }) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                errorMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
