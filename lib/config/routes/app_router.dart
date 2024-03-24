import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/features/auth/view/cubit/login/login_cubit.dart';
import 'package:almanar_application/features/auth/view/screens/auth_layout_screens/auth_layout_screen.dart';
import 'package:almanar_application/features/auth/view/screens/auth_layout_screens/forget_password_screen.dart';
import 'package:almanar_application/features/home/view/cubit/home_cubit.dart';
import 'package:almanar_application/features/home/view/screens/home_layout_screen.dart';
import 'package:almanar_application/features/home_not_subscribe/view/cubit/cubit/home_not_subscribed_cubit.dart';
import 'package:almanar_application/features/home_not_subscribe/view/screens/layout_screen.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/user_details_layout_screen.dart';
import 'package:almanar_application/features/auth/view/screens/auth_layout_screens/verification_code_screen.dart';
import 'package:almanar_application/features/onboard/screens/landing_screen.dart';
import 'package:almanar_application/features/onboard/screens/onboard_screens.dart';
import 'package:almanar_application/features/subscribe/view/cubit/subscription_cubit.dart';
import 'package:almanar_application/features/subscribe/view/screens/choose_subscribtion_screen.dart';
import 'package:almanar_application/features/subscribe/view/screens/subscription_details_screen.dart';
import 'package:almanar_application/features/subscribe/view/screens/success_screen.dart';
import 'package:almanar_application/features/training/view/screens/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/view/screens/auth_layout_screens/enter_new_password_screen.dart';
import '../../injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardScreens(),
        );
      case Routes.landingScreen:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );
      case Routes.homeLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(),
            child: const HomeLayout(),
          ),
        );
      case Routes.successSubscriptionScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessSubscriptionScreen(),
        );
      case Routes.chooseSubscriptionScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SubscriptionCubit>(),
            child: const ChooseSubscription(),
          ),
        );
      case Routes.subscriptionDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SubscriptionCubit>(),
            child: const SubscriptionDetailsScreen(),
          ),
        );
      case Routes.userDetailsLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<UserDetailsCubit>(),
            child: const UserDetailsLayoutScreen(),
          ),
        );
      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
          builder: (_) => const VerificationCodeScreen(),
        );
      case Routes.homeNotSubscribedLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeNotSubscribedCubit(),
            child: const HomeNotSubscribedLayoutScreen(),
          ),
        );
      case Routes.enterNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const EnterNewPasswordScreen(),
        );
      case Routes.trainingScreen:
        return MaterialPageRoute(
          builder: (_) => const TrainingScreen(),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.authLayoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            Map<String, bool> isLogin =
                ModalRoute.of(context)!.settings.arguments as Map<String, bool>;
            return BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: AuthLayoutScreen(
                isLogin: isLogin["isLogin"]!,
              ),
            );
          },
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
    }
  }
}
