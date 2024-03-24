import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/theming/theme.dart';
import '../widgets/onboard_item.dart';

class OnBoardScreens extends StatefulWidget {
  const OnBoardScreens({super.key});

  @override
  State<OnBoardScreens> createState() => _OnBoardScreensState();
}

class _OnBoardScreensState extends State<OnBoardScreens> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              OnBoardItem(
                message: "تعرف على مدربك \nأبو نزار ضروب وطراح",
                imagePath: "assets/images/onboard1.png",
              ),
              OnBoardItem(
                message: "إنشاء خطة تدريب\n للحفاظ على لياقتك",
                imagePath: "assets/images/onboard2.png",
              ),
              OnBoardItem(
                message: "العمل هو مفتاح\n كل نجاح",
                imagePath: "assets/images/onboard3.png",
                isLast: true,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 25.0.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 3,
                effect: WormEffect(
                  activeDotColor: KTheme.mainColor,
                  spacing: 10.0,
                  dotWidth: 20.0,
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
