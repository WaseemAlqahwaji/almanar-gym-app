import 'package:almanar_application/config/networking/api_error_handler.dart';
import 'package:almanar_application/config/networking/api_result.dart';
import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/register/data/models/register_requset_body.dart';
import 'package:almanar_application/features/core/data/models/user.dart';
import 'package:almanar_application/features/register/data/models/verify_request_body.dart';

class RegisterRepo {
  final ApiService _apiService;
  RegisterRepo(this._apiService);
  Future<ApiResult<User>> register(
      RegisterRequsetBody registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult> verifyAccount(VerifyRequestBody verifyRequestBody) async {
    try {
      final response = await _apiService.verifyAccount(verifyRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
