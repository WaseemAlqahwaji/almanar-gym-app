import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/auth/forget_password/data/models/forget_password_body_request.dart';
import 'package:almanar_application/features/auth/forget_password/data/models/forget_password_response.dart';

import '../../../../../config/networking/api_error_handler.dart';
import '../../../../../config/networking/api_result.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordBodyRequest forgetPasswordBodyRequest) async {
    try {
      final response = await _apiService.getResetPasswordCode(forgetPasswordBodyRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
