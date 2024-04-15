import 'package:almanar_application/features/core/view/cubit/cubit/core_cubit.dart';
import 'package:almanar_application/features/core/view/widgets/text_form_item.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../../../config/helpers/validation.dart';
import '../../../../../config/theming/text_style.dart';

class UserDetailsFormScreen extends StatefulWidget {
  const UserDetailsFormScreen({super.key});

  @override
  State<UserDetailsFormScreen> createState() => _UserDetailsFormScreenState();
}

class _UserDetailsFormScreenState extends State<UserDetailsFormScreen> {
  @override
  Widget build(BuildContext ctx) {
    context.read<UserDetailsCubit>().phoneController.text = "0997973038";
    context.read<UserDetailsCubit>().firstNameController.text = "waseem";
    context.read<UserDetailsCubit>().lastNameController.text = "alqahwaji";
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.outgoingSlideOutToRight(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    delay: const Duration(
                      milliseconds: 100,
                    ),
                  ),
                  child: Text(
                    "لنتعرف على معلوماتك",
                    style: TextStyled.font22White600,
                  ),
                ),
                Gap(40.0.h),
                Form(
                  key: context.read<UserDetailsCubit>().playerFormsDetailsKey,
                  child: Column(
                    children: [
                      KTextForm(
                        controller: context
                            .read<UserDetailsCubit>()
                            .firstNameController,
                        title: "الاسم الأول",
                        validator: (value) {
                          return TextFormValidation.textFieldCheck(
                            textController: value,
                            fieldName: "الاسم الأول",
                          );
                        },
                        type: TextInputType.text,
                      ),
                      Gap(15.0.h),
                      KTextForm(
                        controller:
                            context.read<UserDetailsCubit>().lastNameController,
                        title: "الاسم الأخير",
                        validator: (value) {
                          return TextFormValidation.textFieldCheck(
                            textController: value,
                            fieldName: "الاسم الأخير",
                            numberOfChars: 2,
                          );
                        },
                        type: TextInputType.text,
                      ),
                      Gap(15.0.h),
                      KTextForm(
                        readOnly: true,
                        controller: context.read<UserDetailsCubit>().cityNameController,
                        title: "المدينة",
                        onTap: () async {
                          await countryDialog(ctx);
                        },
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return "لا يجب أن يكون حقل المدينة فارغ";
                          }
                          return null;
                        },
                        type: TextInputType.name,
                      ),
                      Gap(15.0.h),
                      KTextForm(
                        controller:
                            context.read<UserDetailsCubit>().phoneController,
                        title: "رقم الهاتف",
                        validator: (value) {
                          return TextFormValidation.numberCheck(
                            number: value,
                          );
                        },
                        type: TextInputType.number,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> countryDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "أختر دولتك",
                style: TextStyled.font18Black600,
              ),
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Container(
                    color: Colors.grey.withOpacity(.7),
                    width: double.infinity,
                    height: 1,
                  ),
                  itemCount: ctx.read<CoreCubit>().countryList.length,
                  itemBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.ltr,
                    child: GestureDetector(
                      onTap: () {
                        ctx.read<UserDetailsCubit>().cityNameController.text = "${ctx.read<CoreCubit>().countryList[index]}y";
                        Navigator.of(context).pop();
                      },
                      child: ListTile(
                        leading: SizedBox(
                          width: 30.0.w,
                          height: 30.0.h,
                          child: CountryIcons.getSvgFlag(
                            ctx.read<CoreCubit>().countryList[index],
                          ),
                        ),
                        title: Text(
                          ctx.read<CoreCubit>().countryList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
