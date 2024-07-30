import 'package:almanar_application/config/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/helpers/base_state.dart';

class CoreBlocListener<Cubit extends BlocBase<BaseState>>
    extends StatelessWidget {
  final Cubit cubit;
  final Function(dynamic data) onSuccess;

  const CoreBlocListener({
    Key? key,
    required this.cubit,
    required this.onSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<Cubit, BaseState>(
      bloc: cubit,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loadingDialog(context);
          },
          success: onSuccess,
          failure: (error) {
            Navigator.pop(context);
            errorDialog(
              context,
              errorMessage: error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: SpinKitSpinningLines(
            color: KTheme.mainColor,
          ),
        ),
      ),
    );
  }

  Future<dynamic> errorDialog(BuildContext context,
      {required String errorMessage}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(30.0.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                errorMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
