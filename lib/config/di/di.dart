import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/config/networking/dio_factory.dart';
import 'package:almanar_application/features/login/data/repo/login_repo.dart';
import 'package:almanar_application/features/login/logic/login_cubit.dart';
import 'package:almanar_application/features/register/data/repo/register_repo.dart';
import 'package:almanar_application/features/register/logic/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
}
