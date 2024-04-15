import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/subscribe/view/cubit/subscription_cubit.dart';
import 'package:almanar_application/features/subscribe/view/widgets/choose_subsctiption_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/domain/enums/subscription_type.dart';

class ChooseSubscription extends StatefulWidget {
  const ChooseSubscription({super.key});

  @override
  State<ChooseSubscription> createState() => _ChooseSubscriptionState();
}

class _ChooseSubscriptionState extends State<ChooseSubscription> {
 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                imageContainer(context),
                imageTextShadowBackground(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "طبيعة الاشتراك",
                    style: TextStyled.font22White600,
                  ),
                  continueButton(context)
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: LayoutBuilder(
              builder: (context, cons) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => Gap(10.0.h),
                    itemCount: SubscriptionType.values.length,
                    itemBuilder: (context, index) {
                      return ChooseSubWidget(
                      height: (cons.maxHeight - 20.0.h - 10.0.h) / 3 , // the 20.0.h is the gap between the items, the 10.0.h is the bottomPadding  
                      title: chooseSubTitle[index],
                      secondary: "200.0",
                      value: SubscriptionType.values[index],
                      groupValue: context.read<SubscriptionCubit>().subscriptionType,
                      isSelected: context.read<SubscriptionCubit>().subscriptionType == SubscriptionType.values[index],
                      onTap: () {
                        setState(() {
                          context.read<SubscriptionCubit>().subscriptionType = SubscriptionType.values[index];
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          context.read<SubscriptionCubit>().subscriptionType = value;
                        });
                      },
                     );
                    }
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container imageContainer(BuildContext context) {
    return Container(
      height: context.getBodyHeight() / 2.3,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.04),
            blurRadius: 50.0, // soften the shadow
            offset: const Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100.0.r),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/any.png",
          ),
        ),
      ),
    );
  }

  Container imageTextShadowBackground() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 10.0.w),
      padding: EdgeInsets.all(10.0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(.4),
            Colors.grey.withOpacity(.4),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "كن مميز",
            style: TextStyled.font28White400.copyWith(
              fontWeight: FontWeight.bold,
              color: KTheme.mainColor,
            ),
          ),
          Text(
            "احصل على وصول غير\n محدود",
            style: TextStyled.font24White600.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          Gap(5.0.h),
          Text("عند الاشتراك سوف تحصل على خطة\n تدريبة كاملة",
              style: TextStyled.font16White400.copyWith(fontSize: 13.sp)),
        ],
      ),
    );
  }

  InkWell continueButton(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        context.pushNamed(Routes.subscriptionDetailsScreen);
      },
      child: Container(
        width: 50.0.w,
        height: 50.0.h,
        decoration: BoxDecoration(
          color: KTheme.mainColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
    );
  }

  List<String> chooseSubTitle = [
    "جدول تمارين",
    "جدول أغذية",
    "جدول تمارين + أغذية",
  ];

  List<int> pricesList = [
    100,
    200,
    300,
  ];
}
