import 'package:almanar_application/features/core/view/cubit/cubit/core_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_router.dart';
import 'config/routes/routes.dart';
import 'config/theming/theme.dart';

class AlmanarApp extends StatelessWidget {
  final AppRouter appRouter;

  const AlmanarApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: KTheme.darkTheme(),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.landingScreen,
        debugShowCheckedModeBanner: false,
        builder: (context, child) => BlocProvider(
          create: (context) {
            return CoreCubit();
          },
          child: SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            ),
          ),
        ),
      ),
    );
  }
}
