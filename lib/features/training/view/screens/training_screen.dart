import 'package:almanar_application/features/training/view/cubit/training_cubit.dart';
import 'package:almanar_application/features/training/view/widgets/training_card_widget.dart';
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
    cardImagesPath.shuffle();
    return Padding(
      padding: EdgeInsets.only(
        left: 10.0.w,
        right: 10.0.w,
        top: 10.0.h
      ),
      child: ListView.separated(
        itemCount: context.read<TrainingCubit>().trainingDays,
        separatorBuilder: (context, index) => Gap(15.0.h),
        itemBuilder: (context, index) => TrainingCardWidget(
              exercisesNumber: 20,
              imagePath: cardImagesPath[index],
              title: daysTitle[index]!,
            ),
      ),
    );
  }

  final Map<int , String> daysTitle = {
    0 : "اليوم الأول",
    1 : "اليوم الثاني",
    2 : "اليوم الثالث",
    3 : "اليوم الرابع",
    4 : "اليوم الخامس",
    5 : "اليوم السادس",
    6 : "اليوم السابع",
  };

  
  final List<String> cardImagesPath = [
    "assets/images/vip_training_card_image0.png",
    "assets/images/vip_training_card_image1.png",
    "assets/images/vip_training_card_image2.png",
    "assets/images/vip_training_card_image0.png",
    "assets/images/vip_training_card_image1.png",
    "assets/images/vip_training_card_image2.png",
    "assets/images/vip_training_card_image1.png",
  ];
}
