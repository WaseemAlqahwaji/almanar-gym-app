import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/routes.dart';
import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';
import 'open_subscribe_dialog.dart';

class CardWidget extends StatelessWidget {
  final double height;
  final String title;
  final bool isVIP;
  final String imagePath;
  final int index;

  const CardWidget({
    super.key,
    required this.isVIP,
    required this.index,
    required this.height,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.04),
            blurRadius: 30.0, // soften the shadow
            offset: const Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      height: height,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          if (!isVIP) {
            context.pushNamed(Routes.trainingScreen);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) => SubscribeDialog(
                imagePath: "assets/images/subscribe_dialog_image.png",
                cancelLable: "إلغاء",
                confirmLable: "كن مميزا",
                dialogTitle: "للترقية إلى مميز",
                dialogDescription: "اشترك لأخذ موعد",
                onCancel: () {
                  Navigator.of(context).pop();
                },
                onConfirmPressed: () {
                  Navigator.of(context).pop(); // removing dialog from widget tree
                  context.pushNamed(Routes.chooseSubscriptionScreen);
                },
              ),
            );
          }
        },
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        imagePath,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.h),
                  child: Text(
                    title,
                    style: TextStyled.font16White400,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: ConditionalBuilder(
                condition: isVIP,
                builder: (context) => bannerWidget(
                  color: Colors.red,
                  bannerText: "PRO",
                ),
                fallback: (context) => bannerWidget(
                  color: KTheme.mainColor.withOpacity(0.6),
                  bannerText: "FREE",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bannerWidget({
    required Color color,
    required String bannerText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.all(5.h),
      child: Text(
        bannerText,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
