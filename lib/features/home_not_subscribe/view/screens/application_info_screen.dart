import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationInfoScreen extends StatelessWidget {
  const ApplicationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ApplicationInfoScreen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0.sp
          ),
        ),
      ),
    );
  }
}
