import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/config/networking/dio_factory.dart';
import 'package:almanar_application/features/auth/data/repo/register_repo.dart';
import 'package:almanar_application/features/auth/logic/register/register_cubit.dart';
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
}