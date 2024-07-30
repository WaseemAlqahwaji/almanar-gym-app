import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../widgets/select_gender_button_widget.dart';
import '../../widgets/user_details_widget.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({super.key});

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "أخبرنا عن نفسك!",
      description: "لنمنحك تجربة أفضل نحتاج للتعرف على جنسك",
      bodyWidget: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (!context.read<UserDetailsCubit>().isMale) {
                  context.read<UserDetailsCubit>().isMale =
                      !context.read<UserDetailsCubit>().isMale;
                }
              });
            },
            child: GenderSelectWidget(
              isSelected: context.read<UserDetailsCubit>().isMale,
              icon: Icons.male,
            ),
          ),
          Gap(40.0.h),
          GestureDetector(
            onTap: () {
              setState(() {
                if (context.read<UserDetailsCubit>().isMale) {
                  context.read<UserDetailsCubit>().isMale =
                      !context.read<UserDetailsCubit>().isMale;
                }
              });
            },
            child: GenderSelectWidget(
              isSelected: !context.read<UserDetailsCubit>().isMale,
              icon: Icons.female,
            ),
          ),
        ],
      ),
    );
  }
}
