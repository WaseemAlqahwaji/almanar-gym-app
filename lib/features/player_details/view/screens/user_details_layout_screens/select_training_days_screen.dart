import 'package:almanar_application/features/auth/view/widgets/list_wheel_widget.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth/view/widgets/user_details_widget.dart';

class SelectTrainingDaysScreen extends StatefulWidget {
  const SelectTrainingDaysScreen({super.key});

  @override
  State<SelectTrainingDaysScreen> createState() =>
      _SelectTrainingDaysScreenState();
}

class _SelectTrainingDaysScreenState extends State<SelectTrainingDaysScreen> {
  final double _itemSize = 100.h;

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  initListItem() {
    _controller.jumpToItem(context.read<UserDetailsCubit>().playerTrainingsDays - 1);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "أخبرنا عن نفسك",
      description: "لنمنحك تجربة أفضل\n نحتاج للتعرف على طبيعة جسمك",
      bodyWidget: ListWheelWidget(
        itemCount: 7,
        haveUnit: const {true: "يوم"},
        controller: _controller,
        initialValue: 1,
        itemSize: _itemSize,
        onChange: (value){
          setState(() {
            context.read<UserDetailsCubit>().playerTrainingsDays = value + 1;
            print(context.read<UserDetailsCubit>().playerTrainingsDays);
          });
        },
        pointerWidth: 100.0.w,
        cubitVariable: context.read<UserDetailsCubit>().playerTrainingsDays,
      ),
    );
  }
}
