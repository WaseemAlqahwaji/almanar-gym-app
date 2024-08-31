import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/auth/enter_new_password/data/model/enter_new_password_request_body.dart';
import 'package:almanar_application/features/auth/enter_new_password/data/model/enter_new_password_response.dart';

import '../../../../../config/networking/api_error_handler.dart';
import '../../../../../config/networking/api_result.dart';

class EnterNewPasswordRepo {
  final ApiService _apiService;

  EnterNewPasswordRepo(this._apiService);
  Future<ApiResult<EnterNewPasswordReponse>> enterNewPassword(EnterNewPasswordRequestBody enterNewPasswordRequestBody) async {
    try {
      final response = await _apiService.enterNewPassword(enterNewPasswordRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
