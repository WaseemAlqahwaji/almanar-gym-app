import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/core/domain/enums/subscription_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChooseSubWidget extends StatefulWidget {
  const ChooseSubWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.onTap,
    required this.isSelected,
    required this.secondary,
    required this.title,
    required this.height,
  });

  final SubscriptionType value;
  final double height;
  final dynamic groupValue;
  final String secondary;
  final void Function(SubscriptionType? subscriptionType)? onChanged;
  final Function()? onTap;
  final bool isSelected;
  final String title;

  @override
  State<ChooseSubWidget> createState() => _ChooseSubWidgetState();
}

class _ChooseSubWidgetState extends State<ChooseSubWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.r),
          border: Border.all(
            width: widget.isSelected ? 1 : 0.5,
            color: widget.isSelected
                ? KTheme.mainColor
                : Colors.grey.withOpacity(.4),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Row(
            children: [
              Radio<SubscriptionType>(
                activeColor: KTheme.mainColor,
                value: widget.value,
                groupValue: widget.groupValue,
                onChanged: widget.onChanged,
              ),
              Gap(5.0.w),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyled.font15WhiteBold.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // it's most of the time is the price so it should be bolder than the title
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Text(
                  widget.secondary,
                  style: TextStyled.font15WhiteBold.copyWith(
                    fontSize: 16.0.sp
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
