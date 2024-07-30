import 'package:almanar_application/features/core/domain/enums/body_type.dart';
import 'package:almanar_application/features/player_details/view/widgets/user_details_widget.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../widgets/select_body_type_widget.dart';

class SelectBodyTypeScreen extends StatefulWidget {
  const SelectBodyTypeScreen({super.key});

  @override
  State<SelectBodyTypeScreen> createState() => _SelectBodyTypeScreenState();
}

class _SelectBodyTypeScreenState extends State<SelectBodyTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "أخبرنا عن نفسك",
      description: "لنمنحك تجربة أفضل\n نحتاج للتعرف على طبيعة جسمك",
      bodyWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectBodyTypeWidget(
                onTap: () {
                  setState(() {
                    context
                        .read<UserDetailsCubit>()
                        .selectBodyType(BodyType.ectomorph);
                  });
                },
                bodyType: "Ectomorph Body",
                imagePath: "assets/images/ectomorph_body.png",
                isSelected: context.read<UserDetailsCubit>().playerBodyType ==
                    BodyType.ectomorph,
              ),
              SelectBodyTypeWidget(
                onTap: () {
                  setState(() {
                    context.read<UserDetailsCubit>().selectBodyType(BodyType.mesomorph);
                  });
                },
                bodyType: "Mesomorph Body",
                imagePath: "assets/images/mesomorph_body.png",
                isSelected: context.read<UserDetailsCubit>().playerBodyType == BodyType.mesomorph,
              ),
            ],
          ),
          Gap(20.0.h),
          SelectBodyTypeWidget(
            onTap: () {
              setState(() {
                context
                    .read<UserDetailsCubit>()
                    .selectBodyType(BodyType.endomorph);
              });
            },
            bodyType: "Endomorph Body",
            imagePath: "assets/images/endomorph_body.png",
            isSelected: context.read<UserDetailsCubit>().playerBodyType ==
                BodyType.endomorph,
          ),
        ],
      ),
    );
  }
}
