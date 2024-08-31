import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../config/theming/text_style.dart';
import '../../../../config/theming/theme.dart';
import '../../cubit/user_details_state.dart';
import '../../data/model/country_model.dart';

class CountriesDialog extends StatefulWidget {
  const CountriesDialog({super.key});

  @override
  State<CountriesDialog> createState() => _CountriesDialogState();
}

class _CountriesDialogState extends State<CountriesDialog> {
  Widget countryDialogWidget = Center(
    child: SpinKitSpinningLines(
      color: KTheme.mainColor,
    ),
  );

  @override
  void initState() {
    context.read<UserDetailsCubit>().emitGetCountryState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<UserDetailsCubit, UserDetailsState>(
            child: countryDialogWidget,
            listenWhen: (previous, current) =>
                current is GetCountriesFaliure ||
                current is GetCountriesSuccess ||
                current is GetCountriesLoading,
            listener: (context, state) {
              state.whenOrNull(
                getCountriesFaliure: (String error) {
                  countryDialogWidget = Center(child: Text(error));
                },
                getCountriesSuccess: (data) {
                  CountryModel countryModel = data as CountryModel;
                  countryDialogWidget = Column(
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
                          itemCount: countryModel.countryData.length,
                          itemBuilder: (context, index) => Directionality(
                            textDirection: TextDirection.ltr,
                            child: GestureDetector(
                              onTap: () {
                                context.read<UserDetailsCubit>().countryNameController.text = countryModel.countryData[index].countryName;
                                context.read<UserDetailsCubit>().selectedCountryId = countryModel.countryData[index].id;
                                Navigator.of(context).pop();
                              },
                              child: ListTile(
                                leading: SizedBox(
                                  width: 30.0.w,
                                  height: 30.0.h,
                                  child: CountryIcons.getSvgFlag(
                                    countryModel.countryData[index].countryCode,
                                  ),
                                ),
                                title: Text(
                                  countryModel.countryData[index].countryName,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
              setState(() {});
            },
          ),
        ),
      );
    });
  }
}
