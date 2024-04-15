import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/features/home_not_subscribe/view/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeNotSubscribedScreen extends StatefulWidget {
  const HomeNotSubscribedScreen({super.key});

  @override
  State<HomeNotSubscribedScreen> createState() =>
      _HomeNotSubscribedScreenState();
}

class _HomeNotSubscribedScreenState extends State<HomeNotSubscribedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_home.jpg",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "مرحبا بك ...",
                      textAlign: TextAlign.center,
                      style: TextStyled.font22White600,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 80.0.h,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, cons) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cardDetails.length,
                        itemBuilder: (context, index) {
                          return CardWidget(
                            height: cons.maxHeight / (cardDetails.length + 0.2), // 0.2 to make the background appear
                            imagePath: cardDetails[index]["imagePath"],
                            isVIP: cardDetails[index]["isVIP"],
                            title: cardDetails[index]["title"],
                            index: index,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<int, dynamic> cardDetails = {
    0: {
      "imagePath": "assets/images/free_training_card_image.jpg",
      "title": "ابدأ بعض التمارين",
      "isVIP": false,
    },
    1: {
      "imagePath": "assets/images/vip_training_card_image.jpg",
      "title": "خطة تمارين خاصة",
      "isVIP": true,
    },
    2: {
      "imagePath": "assets/images/food_card_image.png",
      "title": " نظام غذائي خاص",
      "isVIP": true,
    },
  };
}
