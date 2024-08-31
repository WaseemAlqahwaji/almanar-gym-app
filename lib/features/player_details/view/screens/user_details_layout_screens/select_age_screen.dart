import 'package:almanar_application/features/player_details/view/widgets/list_wheel_widget.dart';
import 'package:almanar_application/features/player_details/view/widgets/user_details_widget.dart';
import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAgeScreen extends StatefulWidget {
  const SelectAgeScreen({super.key});

  @override
  State<SelectAgeScreen> createState() => _SelectAgeScreenState();
}

class _SelectAgeScreenState extends State<SelectAgeScreen> {
  double numberItemSize = 100.h;

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  initListData() {
    _controller.jumpToItem(context.read<UserDetailsCubit>().playerAge - 18);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "كم عمرك ؟",
      description: "وهذا يساعدنا في إنشاء خطتك الشخصية",
      bodyWidget: ListWheelWidget(
        controller: _controller,
        itemSize: numberItemSize,
        onChange: (value) {
          setState(() {
            context.read<UserDetailsCubit>().playerAge = value + 18;
          });
        },
        itemCount: 65,
        initialValue: 18,
        cubitVariable: context.read<UserDetailsCubit>().playerAge,
        pointerWidth: 100,
        haveUnit: const {false: ""}, // there is no unit in age
      ),
    );
  }
}
