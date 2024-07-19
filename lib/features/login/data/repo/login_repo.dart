import 'package:almanar_application/config/networking/api_service.dart';
import 'package:almanar_application/features/login/data/models/login_requset_body.dart';

import '../../../../config/networking/api_error_handler.dart';
import '../../../../config/networking/api_result.dart';
import '../../../core/data/models/user.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<User>> login(LoginRequsetBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
