import 'package:almanar_application/config/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: 120.h,
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
            const Gap(20.0),
            Text(
              "وسيم أمير القهوجي",
              style: TextStyled.font24White600,
            ),
            const Gap(10.0),
            Text(
              "زيادة وزن",
              style: TextStyled.font16White400.copyWith(color: Colors.grey),
            ),
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(.4),
              width: double.infinity,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "تسجيل خروج",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(.4),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
