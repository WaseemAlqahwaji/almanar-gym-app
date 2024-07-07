import 'package:almanar_application/config/networking/api_error_handler.dart';
import 'package:almanar_application/config/networking/api_result.dart';
import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/sign_up/data/models/register_requset_body.dart';
import 'package:almanar_application/features/sign_up/data/models/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;
  RegisterRepo(this._apiService);
  Future<ApiResult<RegisterResponse>> register(
    RegisterRequsetBody registerRequestBody,
  ) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
