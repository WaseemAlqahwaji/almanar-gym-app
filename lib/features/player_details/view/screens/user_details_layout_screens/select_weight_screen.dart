import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:list_wheel_scroll_view_nls/list_wheel_scroll_view_nls.dart';

import '../../../../../config/theming/text_style.dart';
import '../../../../../config/theming/theme.dart';
import '../../widgets/user_details_widget.dart';

class SelectWeightScreen extends StatefulWidget {
  const SelectWeightScreen({super.key});

  @override
  State<SelectWeightScreen> createState() => _SelectWeightScreenState();
}

class _SelectWeightScreenState extends State<SelectWeightScreen> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();

  initListData() {
    _controller.jumpToItem(context.read<UserDetailsCubit>().playerWeight - 40);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initListData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "ما وزنك؟",
      description: "يمكنك دائمًا تغيير هذا لاحقًا",
      bodyWidget: Flexible(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  "KG",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Gap(5.0.w),
                Text(
                  context.read<UserDetailsCubit>().playerWeight.toString(),
                  style: TextStyled.font48White600,
                ),
              ],
            ),
            Gap(20.0.h),
            Flexible(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListWheelScrollViewX(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        context.read<UserDetailsCubit>().playerWeight =
                            value + 40;
                        if (kDebugMode) {
                          print(context.read<UserDetailsCubit>().playerWeight);
                        }
                      });
                    },
                    itemExtent: 15.h,
                    children: List.generate(
                      111,
                      (index) {
                        if (index % 5 == 0) {
                          return tallIndicator();
                        } else {
                          return lowIndicator();
                        }
                      },
                    ),
                  ),
                  pointerIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pointerIndicator() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Container(
        color: KTheme.mainColor,
        width: 2.w,
      ),
    );
  }

  Column tallIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: KTheme.mainColor,
          height: 40.0.h,
          width: 2.w,
        ),
      ],
    );
  }

  Column lowIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: KTheme.mainColor,
          height: 20.0.h,
          width: 2.w,
        ),
      ],
    );
  }
}
