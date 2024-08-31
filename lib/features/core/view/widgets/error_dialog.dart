  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> errorDialog(BuildContext context,{required String error}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error,
              ),
            ],
          ),
        ),
      ),
    );
  }