import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/config/networking/dio_factory.dart';
import 'package:almanar_application/features/auth/forget_password/cubit/forget_password_cubit.dart';
import 'package:almanar_application/features/auth/forget_password/data/repo/forget_password_repo.dart';
import 'package:almanar_application/features/auth/verify_reset_password_code/cubit/verify_reset_password_code_cubit.dart';
import 'package:almanar_application/features/login/data/repo/login_repo.dart';
import 'package:almanar_application/features/login/logic/login_cubit.dart';
import 'package:almanar_application/features/player_details/data/repo/get_countries_repo.dart';
import 'package:almanar_application/features/player_details/cubit/user_details_cubit.dart';
import 'package:almanar_application/features/register/data/repo/register_repo.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/enter_new_password/cubit/enter_new_password_cubit.dart';
import '../../features/auth/enter_new_password/data/repo/enter_new_password_repo.dart';
import '../../features/auth/verify_reset_password_code/data/repo/verify_reset_password_code_repo.dart';
import '../../features/player_details/data/repo/edit_profile_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // signup
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // forget password
  getIt.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(getIt()));
  getIt.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));

  // verify reset password
  getIt.registerLazySingleton<VerifyResetPasswordCodeRepo>(() => VerifyResetPasswordCodeRepo(getIt()));
  getIt.registerFactory<VerifyResetPasswordCodeCubit>(() => VerifyResetPasswordCodeCubit(getIt(),getIt()));

  // enter new password
  getIt.registerLazySingleton<EnterNewPasswordRepo>(() => EnterNewPasswordRepo(getIt()));
  getIt.registerLazySingleton<EnterNewPasswordCubit>(() => EnterNewPasswordCubit(getIt()));
  
  // UserDetails
  getIt.registerLazySingleton<UserDetailsCubit>(() => UserDetailsCubit(getIt(),getIt()));
  getIt.registerLazySingleton<EditProfileRepo>(() => EditProfileRepo(getIt()));
  getIt.registerLazySingleton<GetCountriesRepo>(() => GetCountriesRepo(getIt()));
}
