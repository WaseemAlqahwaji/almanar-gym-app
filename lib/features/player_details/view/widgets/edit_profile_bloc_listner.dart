import 'package:almanar_application/config/helpers/extensions.dart';
import 'package:almanar_application/features/core/view/widgets/error_dialog.dart';
import 'package:almanar_application/features/core/view/widgets/loading_dialog.dart';
import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:almanar_application/features/player_details/cubit/user_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';

class EditProfileBlocListner extends StatelessWidget {
  const EditProfileBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsCubit, UserDetailsState>(
      listenWhen: (previous, current) =>
          current is EditProfileLoading ||
          current is EditProfileFaliure ||
          current is EditProfileSuccess,
      listener: (context, state) {
        state.whenOrNull(
          editProfileFaliure: (error) => errorDialog(context, error: error),
          editProfileLoading: () => loadingDialog(context),
          editProfileSuccess: (data) {
            context.pushNamedAndRemoveUntil(
              Routes.homeNotSubscribedLayoutScreen,
              predicate: (route) => false,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
