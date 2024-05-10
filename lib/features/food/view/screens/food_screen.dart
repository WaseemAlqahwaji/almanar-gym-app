import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/food/view/cubit/food_cubit.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: context.read<FoodCubit>().foodDays,
      separatorBuilder: (context, index) => Gap(14.0.h),
      itemBuilder: (context, index) => Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  iconColor: Colors.white,
                  tapBodyToCollapse: true
                ),
                header: Text(
                  daysTitle[index]!,
                  style: TextStyled.font22White600,
                ),
                collapsed: const SizedBox.shrink(),
                expanded: Text(
                  "Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.",
                  style: TextStyled.font15WhiteBold,
                ),
              ),
              const Gap(3),
              Container(
                width: double.infinity,
                color: KTheme.mainColor,
                height: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Map<int, String> daysTitle = {
    0: "اليوم الأول",
    1: "اليوم الثاني",
    2: "اليوم الثالث",
    3: "اليوم الرابع",
    4: "اليوم الخامس",
    5: "اليوم السادس",
    6: "اليوم السابع",
  };
}
