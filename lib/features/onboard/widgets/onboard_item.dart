import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/routes/routes.dart';
import '../../../config/theming/text_style.dart';


class OnBoardItem extends StatefulWidget {
  final String message;
  final String imagePath;
  final bool isLast;

  const OnBoardItem({
    super.key,
    required this.message,
    required this.imagePath,
    this.isLast = false,
  });

  @override
  State<OnBoardItem> createState() => _OnBoardItemState();
}

class _OnBoardItemState extends State<OnBoardItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 90,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          flex: 50,
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              widget.message,
              softWrap: true,
              style: TextStyled.font24White600.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        ConditionalBuilder(
          condition: widget.isLast == true,
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: KButton(
              haveArrow: true,
              width: double.infinity,
              onPressed: () {
                context.pushNamedAndRemoveUntil(
                  Routes.landingScreen,
                  predicate: (Route<dynamic> route) => false,
                );
              },
              lable: "أبدأ الآن",
            ),
          ),
          fallback: (context) => Container(),
        ),
        const Spacer(
          flex: 20,
        ),
      ],
    );
  }
}
