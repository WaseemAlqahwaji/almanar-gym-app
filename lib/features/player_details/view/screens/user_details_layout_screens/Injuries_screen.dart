import 'package:almanar_application/config/theming/text_style.dart';
import 'package:almanar_application/config/theming/theme.dart';
import 'package:almanar_application/features/player_details/view/widgets/user_details_widget.dart';
import 'package:almanar_application/features/core/view/widgets/text_form_item.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InjuriesScreen extends StatefulWidget {
  const InjuriesScreen({super.key});

  @override
  State<InjuriesScreen> createState() => _InjuriesScreenState();
}

class _InjuriesScreenState extends State<InjuriesScreen> {

  @override
  Widget build(BuildContext context) {
    return UserDetailsWidget(
      title: "أخبرنا عن نفسك",
      description: "لنمنحك تجربة أفضل\n نحتاج للتعرف على طبيعة جسمك",
      bodyWidget: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: context.read<UserDetailsCubit>().haveInjuries,
                activeColor: KTheme.mainColor,
                checkColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    context.read<UserDetailsCubit>().haveInjuries = value;
                    context.read<UserDetailsCubit>().injuriesController.clear();
                  });
                },
              ),
              Text(
                "نعم أعاني من الاصابات",
                style: TextStyled.font16White400,
              )
            ],
          ),
          Form(
            key: context.read<UserDetailsCubit>().injuriesKey,
            child: KTextForm(
              isEnabled: context.read<UserDetailsCubit>().haveInjuries,
              controller: context.read<UserDetailsCubit>().injuriesController,
              title: "اشرح الاصابة",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "لا يجب أن يكون هذا الحقل فارغ";
                }
                return null;
              },
              type: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
