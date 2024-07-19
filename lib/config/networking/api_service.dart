import 'package:almanar_application/config/networking/api_constants.dart';
import 'package:almanar_application/features/login/data/models/login_requset_body.dart';
import 'package:almanar_application/features/register/data/models/register_requset_body.dart';
import 'package:almanar_application/features/core/data/models/user.dart';
import 'package:almanar_application/features/register/data/models/verify_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<User> register(
    @Body() RegisterRequsetBody registerRequestBody,
  );

  @POST(ApiConstants.verifyAccount)
  Future verifyAccount(
    @Body() VerifyRequestBody verifyRequestBody,
  );

  @POST(ApiConstants.login)
  Future<User> login(
    @Body() LoginRequsetBody loginRequestBody,
  );
}
