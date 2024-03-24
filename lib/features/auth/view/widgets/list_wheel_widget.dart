import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/auth/view/widgets/pointer_divider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ListWheelWidget extends StatelessWidget {
  final ScrollController controller;
  final double itemSize;
  final void Function(int) onChange;
  final int? itemCount;
  final int? initialValue;
  final dynamic cubitVariable;
  final double pointerWidth;
  final Map<bool, String>? haveUnit; // haveUnit and the unit it self
  final List<String>? stringsList;
  final List? enumValueList;

  const ListWheelWidget({
    super.key,
    required this.controller,
    required this.itemSize,
    required this.onChange,
    required this.itemCount,
    required this.initialValue,
    required this.cubitVariable,
    required this.pointerWidth,
    required this.haveUnit,
  })  : stringsList = null,
        enumValueList = null;

  const ListWheelWidget.strings({
    super.key,
    required this.pointerWidth,
    required this.controller,
    required this.itemSize,
    required this.onChange,
    required this.stringsList,
    required this.cubitVariable,
    required this.enumValueList,
  })  : haveUnit = null,
        initialValue = null,
        itemCount = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getBodyHeight() / 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListWheelScrollView(
            controller: controller,
            onSelectedItemChanged: onChange,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: 3,
            perspective: 0.005,
            itemExtent: itemSize,
            children: stringsList == null
                ? buildNumbersList(context)
                : buildStringsList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pointerDivider(width: pointerWidth.w),
              Gap(itemSize),
              pointerDivider(width: pointerWidth.w),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> buildStringsList() {
    return List.generate(stringsList!.length, (index) {
      return Center(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  stringsList![index],
                  style: enumValueList![index] == cubitVariable
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 24.0.sp,
                            )
                          : TextStyle(
                              color: Colors.grey.withOpacity(.7),
                              fontSize: 20.0.sp,
                            ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> buildNumbersList(BuildContext context) {
    return List.generate(
      itemCount!,
      (index) => Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              (index + initialValue!).toString(),
              style: index == cubitVariable - initialValue
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: 44.0.sp,
                    )
                  : TextStyle(
                      color: Colors.grey.withOpacity(.7),
                      fontSize: 24.0.sp,
                    ),
            ),
          ),
          haveUnit!.keys.first ? Gap(10.0.w) : const SizedBox.shrink(),
          ConditionalBuilder(
            condition: haveUnit!.keys.first,
            builder: (context) => ConditionalBuilder(
              condition: cubitVariable - initialValue == index,
              builder: (context) => Text(
                haveUnit!.values.first,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              fallback: (context) => const SizedBox.shrink(),
            ),
            fallback: (context) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
