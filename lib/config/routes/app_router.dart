import 'package:almanar_application/config/di/di.dart';
import 'package:almanar_application/config/routes/routes.dart';
import 'package:almanar_application/features/login/logic/login_cubit.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:almanar_application/features/auth/view/screens/auth_layout_screens/auth_layout_screen.dart';
import 'package:almanar_application/features/food/view/cubit/food_cubit.dart';
import 'package:almanar_application/features/home/view/cubit/home_cubit.dart';
import 'package:almanar_application/features/home/view/screens/home_layout_screen.dart';
import 'package:almanar_application/features/home_not_subscribe/view/cubit/cubit/home_not_subscribed_cubit.dart';
import 'package:almanar_application/features/home_not_subscribe/view/screens/layout_screen.dart';
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart';
import 'package:almanar_application/features/player_details/view/screens/user_details_layout_screens/user_details_layout_screen.dart';
import 'package:almanar_application/features/register/view/screens/register_verification_code_screen.dart';
import 'package:almanar_application/features/onboard/screens/landing_screen.dart';
import 'package:almanar_application/features/onboard/screens/onboard_screens.dart';
import 'package:almanar_application/features/subscribe/view/cubit/subscription_cubit.dart';
import 'package:almanar_application/features/subscribe/view/screens/choose_subscribtion_screen.dart';
import 'package:almanar_application/features/subscribe/view/screens/subscription_details_screen.dart';
import 'package:almanar_application/features/subscribe/view/screens/success_screen.dart';
import 'package:almanar_application/features/training/view/cubit/training_cubit.dart';
import 'package:almanar_application/features/training/view/screens/training_day_details.dart';
import 'package:almanar_application/features/training/view/screens/training_muscles_screen.dart';
import 'package:almanar_application/features/training/view/screens/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/view/screens/enter_new_password_screen.dart';
import '../../features/auth/view/screens/forget_password_screen.dart';
import '../../features/auth/view/screens/verification_code_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardScreens(),
        );
      case Routes.trainingDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<TrainingCubit>(),
            child: const TrainingDayDetails(),
          ),
        );
      case Routes.trainingMusclesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<TrainingCubit>(),
            child: const TrainingMusclesScreen(),
          ),
        );
      case Routes.landingScreen:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );
      case Routes.homeLayoutScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<HomeCubit>()),
              BlocProvider(create: (context) => getIt<TrainingCubit>()),
              BlocProvider(create: (context) => getIt<FoodCubit>()),
            ],
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
      case Routes.registerVerificationCodeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<RegisterCubit>(),
            child: const RegisterVerificationCodeScreen(),
          ),
        );
      case Routes.authLayoutScreen:
        return MaterialPageRoute(
          builder: (context) {
            Map<String, bool> isLogin =
                ModalRoute.of(context)!.settings.arguments as Map<String, bool>;
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<LoginCubit>()),
                BlocProvider(create: (context) => getIt<RegisterCubit>()),
              ],
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
