import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/player_details/view/widgets/list_wheel_widget.dart';
import 'package:almanar_application/features/player_details/view/widgets/user_details_widget.dart';
import 'package:almanar_application/features/core/domain/enums/practicing_habit.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SelectPracticingScreen extends StatefulWidget {
  const SelectPracticingScreen({super.key});

  @override
  State<SelectPracticingScreen> createState() => _SelectPracticingScreenState();
}

class _SelectPracticingScreenState extends State<SelectPracticingScreen> {
  double itemSize = 100.0.h;

  final FixedExtentScrollController _controller = FixedExtentScrollController();
  
  void initListItem(){
    _controller.jumpToItem(context.read<UserDetailsCubit>().practicingHabit.index);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListItem());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "هل مارست التمارين مسبقا ؟",
      description: "لنمنحك تجربة أفضل\n نحتاج للتعرف على فترة تمرينك السابقة",
      bodyWidget: ListWheelWidget.strings(
        enumValueList: PracticingHabit.values,
        pointerWidth: context.getScreenWidth() / 1.5,
        cubitVariable: context.read<UserDetailsCubit>().practicingHabit,
        controller: _controller,
        itemSize: itemSize,
        onChange: (index) {
          setState(() {
            context.read<UserDetailsCubit>().practicingHabit = PracticingHabit.values[index];
            if (kDebugMode) {
              print(context.read<UserDetailsCubit>().practicingHabit);
            }
          });
        },
        stringsList: _stringsList,
      ),
    );
  }
  final List<String> _stringsList = [
    "منتظم أكثر شهرين",
    "منتظم منذ شهر",
    "لم أمارس الرياضة من قبل",
    "منقطع منذ شهر",
    "منقطع أكثر شهرين",
  ];
}
