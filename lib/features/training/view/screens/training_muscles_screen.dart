import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TrainingMusclesScreen extends StatefulWidget {
  const TrainingMusclesScreen({super.key});

  @override
  State<TrainingMusclesScreen> createState() => _TrainingMusclesScreenState();
}

class _TrainingMusclesScreenState extends State<TrainingMusclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Row(
              children: [
                const Icon(
                  Icons.video_camera_back,
                  color: Colors.white,
                ),
                const Gap(5),
                Text(
                  "فيديو",
                  style: TextStyled.font16White400,
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            padding: EdgeInsets.all(30.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Image.asset("assets/images/pushup_guy1.png"),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Column(
                children: [
                  Text(
                    "صدر علوي",
                    style: TextStyled.font24White600.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    "شرح عن التمرين",
                    style: TextStyled.font16Grey400,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Text(
            "3x16",
            style: TextStyled.font48White600,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: KButton(
              onPressed: () {},
              lable: "أبدأ",
              haveArrow: false,
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
