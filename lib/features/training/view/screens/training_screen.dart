import 'package:almanar_application/features/training/view/cubit/training_cubit.dart';
import 'package:almanar_application/features/training/view/widgets/training_card_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0.w,
        right: 10.0.w,
        top: 10.0.h
      ),
      child: ListView.separated(
        itemCount: context.read<TrainingCubit>().trainingDays,
        separatorBuilder: (context, index) => const Gap(10.0),
        itemBuilder: (context, index) => ConditionalBuilder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: TrainingCardWidget(
              exercisesNumber: 20,
              imagePath: "assets/images/vip_training_card_image.jpg",
              title: daysTitle[index]!,
            ),
          ),
          condition: true,
          fallback: (context) => TrainingCardWidget(
            exercisesNumber: 20,
            imagePath: "assets/images/vip_training_card_image.jpg",
            title: daysTitle[index]!,
          ),
        ),
      ),
    );
  }

  Map<int , String> daysTitle = {
    0 : "اليوم الأول",
    1 : "اليوم الثاني",
    2 : "اليوم الثالث",
    3 : "اليوم الرابع",
    4 : "اليوم الخامس",
    5 : "اليوم السادس",
    6 : "اليوم السابع",
  };
}
