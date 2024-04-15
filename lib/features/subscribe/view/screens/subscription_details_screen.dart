// ignore: must_be_immutable

import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/core/domain/enums/subscription_type.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:almanar_application/features/core/view/widgets/button_item.dart';
import 'package:almanar_application/features/subscribe/view/cubit/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart' as intl;

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key});

  @override
  State<SubscriptionDetailsScreen> createState() =>
      _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  bool? isConfirmed = true;
  bool isError = false;
  String? formattedDate;
  String? formattedTime;
  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    formattedDate = intl.DateFormat.yMMMMd().format(dateTime);
    formattedTime = intl.DateFormat.jmv().format(dateTime);
    trailingList.add(formattedDate);
    trailingList.add(formattedTime);
    trailingList.add(subscriptionTitleList[
        context.read<SubscriptionCubit>().subscriptionType]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: KBackButton(),
        ),
        title: const Text(
          "إتمام الاشتراك",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.h),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    iconsList[index],
                    color: KTheme.mainColor,
                  ),
                  title: Text(
                    titleList[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      trailingList[index],
                      style: TextStyled.font16Grey400.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: KTheme.mainColor,
                  value: isConfirmed,
                  isError: isError,
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        isError = false;
                      }
                      isConfirmed = value;
                    });
                  },
                ),
                Text(
                  "الموافقة على الشروط والاستخدام",
                  style: TextStyled.font16White400,
                ),
              ],
            ),
            Gap(20.0.h),
            KButton(
              onPressed: () {
                if (isConfirmed!) {
                  context.pushNamed(Routes.successSubscriptionScreen);
                } else {
                  setState(() {
                    isError = true;
                  });
                }
              },
              lable: "متابعة",
              haveArrow: true,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  List<IconData> iconsList = <IconData>[
    Icons.calendar_today,
    Icons.timer,
    Icons.category,
  ];

  List<String> titleList = <String>[
    "تاريخ الاشتراك",
    "وقت الاشتراك",
    "نوع الاشتراك",
  ];

  Map<SubscriptionType, String?> subscriptionTitleList = {
    SubscriptionType.food: "أغذية",
    SubscriptionType.training: "تمارين",
    SubscriptionType.trainingAndFood: "تدريبات + أغذية",
  };

  // it will have variables, so we need to insert them before the screen loaded
  // it have the same order as the below ones
  List trailingList = [];
}
