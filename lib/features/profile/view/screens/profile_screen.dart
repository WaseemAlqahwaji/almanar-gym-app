import 'package:almanar_application/config/helpers/hex_color.dart';
import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/features/core/view/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(10.0.h),
        child: Column(
          children: [
            userDetailsWidget(),
            Expanded(child: Container()),
            editInformationWidget(),
            Expanded(child: Container()),
            logoutWidget(),
          ],
        ),
      ),
    );
  }

  Widget editInformationWidget() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "تعديل المعلومات",
                style: TextStyled.font15WhiteBold,
              ),
              KBackButton(
                onTap: () {},
              ),
            ],
          ),
          const Gap(10.0),
          myDivider(dividerColor: Colors.white)
        ],
      ),
    );
  }

  Column userDetailsWidget() {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/vip_training_card_image0.png",
              ),
            ),
          ),
        ),
        Gap(20.0.h),
        Text(
          "وسيم أمير القهوجي",
          style: TextStyled.font24White600,
        ),
        Gap(10.0.h),
        Text(
          "خفض وزن",
          style: TextStyled.font16White400.copyWith(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget logoutWidget() {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          myDivider(),
          Padding(
            padding: EdgeInsets.all(15.h),
            child: Row(
              children: [
                Text(
                  "تسجيل خروج",
                  style: TextStyle(
                    color: HexColor("FF2424"),
                  ),
                ),
              ],
            ),
          ),
          myDivider(),
        ],
      ),
    );
  }

  Container myDivider({dividerColor = Colors.grey}) {
    if (dividerColor == Colors.grey) dividerColor = Colors.grey.withOpacity(.2);
    return Container(
      color: dividerColor,
      width: double.infinity,
      height: 0.5,
    );
  }
}
