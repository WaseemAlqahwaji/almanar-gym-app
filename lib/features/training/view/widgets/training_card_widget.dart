import 'package:almanar_application/features/training/view/widgets/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/theming/text_style.dart';

class TrainingCardWidget extends StatefulWidget {
  final String title;
  final int exercisesNumber;
  final String imagePath;
  final void Function()? onTap;

  const TrainingCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.exercisesNumber,
    required this.onTap,
  });

  @override
  State<TrainingCardWidget> createState() => _TrainingCardWidgetState();
}

class _TrainingCardWidgetState extends State<TrainingCardWidget> {
  double cardBorder = 10.0.r;
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
      height: 160.h,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorder),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.imagePath,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(cardBorder),
                        gradient: LinearGradient(colors: [
                          Colors.black87.withOpacity(.4),
                          Colors.black87.withOpacity(.4),
                        ]),
                      ),
                    )
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: 10.0.h,
                        ),
                        child: Text(widget.title,
                            style: TextStyled.font16White400),
                      ),
                      Gap(10.0.h),
                      GlassContainer(
                        glassHeight: 30.0.h,
                        glassWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Expanded(
                                child: Text(
                                  "التمارين : ${widget.exercisesNumber}",
                                  textAlign: TextAlign.center,
                                  style: TextStyled.font16White400.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
