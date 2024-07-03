import 'package:almanar_application/config/networking/api_result.dart';
import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/auth/data/model/register_requset_body.dart';
import 'package:almanar_application/features/auth/data/model/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;

  RegisterRepo(this._apiService);

  Future<ApiResult<RegisterResponse>> register(
      RegisterRequsetBody registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}