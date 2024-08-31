import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_practicing_screen.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_age_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_body_type_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_gender_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_goal_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_tall_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_training_days_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/select_weight_screen.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/user_details_forms_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/view/widgets/back_button.dart';
import '../../../cubit/user_details_state.dart';
import 'injuries_screen.dart';

class UserDetailsLayoutScreen extends StatefulWidget {
  const UserDetailsLayoutScreen({super.key});

  @override
  State<UserDetailsLayoutScreen> createState() =>
      _UserDetailsLayoutScreenState();
}

class _UserDetailsLayoutScreenState extends State<UserDetailsLayoutScreen> {
  @override
  void initState() {
    context.read<UserDetailsCubit>().pageCount = userDetailsSubScreens.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller:
                  context.read<UserDetailsCubit>().userDetailsPageController,
              children: userDetailsSubScreens,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<UserDetailsCubit, UserDetailsState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition:
                          context.read<UserDetailsCubit>().currentIndex == 0,
                      builder: (context) => const SizedBox.shrink(),
                      fallback: (context) {
                        return KBackButton(
                          onTap: () {
                            context.read<UserDetailsCubit>().backAction();
                          },
                        );
                      },
                    );
                  },
                ),
                KButton(
                  onPressed: () {
                    if (context.read<UserDetailsCubit>().contAction()) {
                      context.read<UserDetailsCubit>().editProfile();
                    }
                  },
                  lable: "متابعة",
                  haveArrow: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> userDetailsSubScreens = [
    const UserDetailsFormScreen(),
    const SelectGenderScreen(),
    const SelectAgeScreen(),
    const SelectWeightScreen(),
    const SelectTallScreen(),
    const SelectBodyTypeScreen(),
    const SelectPracticingScreen(),
    const SelectTrainingDaysScreen(),
    const SelectGoalScreen(),
    const InjuriesScreen(),
  ];
}
