import 'package:almanar_application/config/networking/api_result.dart';
import 'package:almanar_application/features/player_details/data/model/country_model.dart';

import '../../../../config/networking/api_error_handler.dart';
import '../../../../config/networking/api_service.dart';

class GetCountriesRepo {
  final ApiService _apiService;

  GetCountriesRepo(this._apiService);
  Future<ApiResult<CountryModel>> getCountries() async {
    try {
      final response = await _apiService.getCountries();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}