import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../auth/view/widgets/list_wheel_widget.dart';
import '../../../../auth/view/widgets/user_details_widget.dart';

class SelectTallScreen extends StatefulWidget {
  const SelectTallScreen({super.key});

  @override
  State<SelectTallScreen> createState() => _SelectTallScreenState();
}

class _SelectTallScreenState extends State<SelectTallScreen> {
  double numberItemSize = 100.h;
  int initialValue = 140;

  final FixedExtentScrollController _controller = FixedExtentScrollController();

  initListData() {
    _controller.jumpToItem(context.read<UserDetailsCubit>().playerTall - 140);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "ما هو طولك؟!",
      description: "وهذا يساعدنا في إنشاء خطتك الشخصية",
      bodyWidget: ListWheelWidget(
        haveUnit: const {true : "cm"},
        controller: _controller,
        itemSize: numberItemSize,
        onChange: (value) {
          setState(() {
            context.read<UserDetailsCubit>().playerTall = value + initialValue;
          });
        },
        itemCount: 61,
        initialValue: 140,
        cubitVariable: context.read<UserDetailsCubit>().playerTall,
        pointerWidth: 140,
      ),
    );
  }
}
