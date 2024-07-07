import 'package:almanar_application/config/networking/api_constants.dart';
import 'package:almanar_application/features/sign_up/data/models/register_requset_body.dart';
import 'package:almanar_application/features/sign_up/data/models/register_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
    @Body() RegisterRequsetBody registerRequsetBody,

  );
}