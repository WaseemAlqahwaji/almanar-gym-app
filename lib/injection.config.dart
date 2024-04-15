// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:almanar_application/features/auth/view/cubit/login/login_cubit.dart'
    as _i3;
import 'package:almanar_application/features/food/view/cubit/food_cubit.dart'
    as _i4;
import 'package:almanar_application/features/home/view/cubit/home_cubit.dart'
    as _i5;
import 'package:almanar_application/features/home_not_subscribe/view/cubit/cubit/home_not_subscribed_cubit.dart'
    as _i6;
import 'package:almanar_application/features/player_details/view/cubit/user_details/user_details_cubit.dart'
    as _i7;
import 'package:almanar_application/features/subscribe/view/cubit/subscription_cubit.dart'
    as _i9;
import 'package:almanar_application/features/training/view/cubit/training_cubit.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.LoginCubit>(() => _i3.LoginCubit());
  gh.singleton<_i4.FoodCubit>(() => _i4.FoodCubit());
  gh.singleton<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.singleton<_i6.HomeNotSubscribedCubit>(() => _i6.HomeNotSubscribedCubit());
  gh.singleton<_i7.UserDetailsCubit>(() => _i7.UserDetailsCubit());
  gh.singleton<_i8.TrainingCubit>(() => _i8.TrainingCubit());
  gh.lazySingleton<_i9.SubscriptionCubit>(() => _i9.SubscriptionCubit());
  return getIt;
}
