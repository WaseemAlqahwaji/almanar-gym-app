import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/helpers/hex_color.dart';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/training/view/cubit/training_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TrainingDayDetails extends StatefulWidget {
  const TrainingDayDetails({
    super.key,
  });

  @override
  State<TrainingDayDetails> createState() => _TrainingDayDetailsState();
}

class _TrainingDayDetailsState extends State<TrainingDayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 140.w,
        child: FloatingActionButton(
          backgroundColor: KTheme.mainColor,
          onPressed: () {},
          child: const Text(
            "أبدأ التمرين",
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            screenHeader(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                height: 100,
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.white : HexColor("D9D9D9"),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "صدر علوي",
                          ),
                          Text(
                            "3x16",
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget screenHeader() {
    return Stack(
      children: [
        Container(
          height: 200.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/vip_training_card_image0.png"),
            ),
          ),
        ),
        Container(
          height: 200.h,
          decoration: BoxDecoration(color: Colors.black.withOpacity(.65)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SizedBox(
            height: 200.h,
            child: Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.read<TrainingCubit>().daysTitle[
                            context.read<TrainingCubit>().trainingDays - 1]!,
                        style: TextStyled.font22White600,
                      ),
                      Gap(10.h),
                      Text(
                        "تمارين صدر",
                        style: TextStyled.font16Grey400,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Spacer(),
                  KBackButton(
                    onTap: () {
                      context.pop();
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
