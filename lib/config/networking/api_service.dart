import 'package:almanar_application/config/networking/api_constants.dart';
import 'package:almanar_application/features/register/data/models/register_requset_body.dart';
import 'package:almanar_application/features/register/data/models/register_response.dart';
import 'package:almanar_application/features/register/data/models/verify_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<RegisterResponse> register(
    @Body() RegisterRequsetBody registerRequestBody,
  );

  @POST(ApiConstants.verifyAccount)
  Future verifyAccount(
    @Body() VerifyRequestBody verifyRequestBody,
  );
}
