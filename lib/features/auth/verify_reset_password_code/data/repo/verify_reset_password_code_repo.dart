import 'package:almanar_application/config/networking/api_service.dart';

import '../../../../../config/networking/api_error_handler.dart';
import '../../../../../config/networking/api_result.dart';
import '../../../../core/data/models/user.dart';
import '../model/verify_reset_password_request_body.dart';

class VerifyResetPasswordCodeRepo {
  final ApiService _apiService;

  VerifyResetPasswordCodeRepo(this._apiService);

  Future<ApiResult<User>> verifyResetPasswordCode(
      VerifyResetPasswordRequestBody verifyResetPasswordRequestBody) async {
    try {
      final response = await _apiService.verifyResetPasswordCode(verifyResetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
