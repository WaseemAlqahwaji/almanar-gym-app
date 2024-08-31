import 'package:almanar_application/features/player_details/data/model/edit_profile_request_body.dart';

import '../../../../config/networking/api_error_handler.dart';
import '../../../../config/networking/api_result.dart';
import '../../../../config/networking/api_service.dart';
import '../../../core/data/models/user.dart';

class EditProfileRepo {
  final ApiService _apiService;

  EditProfileRepo(this._apiService);
  Future<ApiResult<User>> editProfile(EditProfileRequestBody editProfileRequestBody) async {
    try {
      final response = await _apiService.editProfile(editProfileRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}