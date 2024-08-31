import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/domain/enums/player_goal.dart';
import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/list_wheel_widget.dart';
import '../../widgets/user_details_widget.dart';

class SelectGoalScreen extends StatefulWidget {
  const SelectGoalScreen({super.key});

  @override
  State<SelectGoalScreen> createState() => _SelectGoalScreenState();
}

class _SelectGoalScreenState extends State<SelectGoalScreen> {
  double itemSize = 100.0.h;

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  void initListItem() {
    if (kDebugMode) {
      print(context.read<UserDetailsCubit>().playerGoal.index);
    }
    _controller.jumpToItem(context.read<UserDetailsCubit>().playerGoal.index);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "ما هو هدفك ؟",
      description: "لنمنحك تجربة أفضل\n أخبرنا عن هدفك",
      bodyWidget: ListWheelWidget.strings(
        enumValueList: PlayerGoal.values,
        pointerWidth: context.getScreenWidth() / 1.5,
        cubitVariable: context.read<UserDetailsCubit>().playerGoal,
        controller: _controller,
        itemSize: itemSize,
        onChange: (index) {
          setState(() {
            context.read<UserDetailsCubit>().playerGoal = PlayerGoal.values[index];
            if (kDebugMode) {
              print(context.read<UserDetailsCubit>().playerGoal);
            }
          });
        },
        stringsList: _stringsList,
      ),
    );
  }

  final List<String> _stringsList = [
    "إعادة تأهيل بدني",
    "إعادة تأهيل بعد الاصابات",
    "تدريبات لاعبين كرة سلة",
    "تدريبات لاعبين كرة يد",
    "كارديو",
    "تنزيل الوزن",
    "زيادة الوزن",
    "الحصول على تناسق",
    "زيادة المرونة",
    "تعلم الأساسيات",
  ];
}
