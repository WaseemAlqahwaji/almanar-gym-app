import 'package:almanar_application/config/networking/api_constants.dart';
import 'package:almanar_application/features/auth/enter_new_password/data/model/enter_new_password_request_body.dart';
import 'package:almanar_application/features/auth/forget_password/data/models/forget_password_body_request.dart';
import 'package:almanar_application/features/auth/forget_password/data/models/forget_password_response.dart';
import 'package:almanar_application/features/auth/verify_reset_password_code/data/model/verify_reset_password_request_body.dart';
import 'package:almanar_application/features/login/data/models/login_requset_body.dart';
import 'package:almanar_application/features/player_details/data/model/country_model.dart';
import 'package:almanar_application/features/register/data/models/register_requset_body.dart';
import 'package:almanar_application/features/core/data/models/user.dart';
import 'package:almanar_application/features/register/data/models/verify_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/enter_new_password/data/model/enter_new_password_response.dart';
import '../../features/player_details/data/model/edit_profile_request_body.dart';

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
    @Body() VerifyRegisterRequestBody verifyRequestBody,
  );

  @POST(ApiConstants.login)
  Future<User> login(
    @Body() LoginRequsetBody loginRequestBody,
  );

  @POST(ApiConstants.getResetPasswordCode)
  Future<ForgetPasswordResponse> getResetPasswordCode(
    @Body() ForgetPasswordBodyRequest loginRequestBody,
  );

  @POST(ApiConstants.verifyResetPasswordCode)
  Future<User> verifyResetPasswordCode(
    @Body() VerifyResetPasswordRequestBody verifyResetPasswordCodeRequestBody,
  );

  @POST(ApiConstants.enterNewPassword)
  Future<EnterNewPasswordReponse> enterNewPassword(
    @Body() EnterNewPasswordRequestBody enterNewPasswordRequestBody,
  );

  @PUT(ApiConstants.editProfile)
  Future<User> editProfile(
    @Body() EditProfileRequestBody editProfileRequestBody,
  );

  @GET(ApiConstants.countries)
  Future<CountryModel> getCountries();
}
