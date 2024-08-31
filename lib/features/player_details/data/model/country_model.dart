import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  @JsonKey(name: 'data')
  final List<CountryData> countryData;

  CountryModel(this.countryData);

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}

@JsonSerializable()
class CountryData {
  final int id;
  @JsonKey(name: 'country')
  final String countryName;
  @JsonKey(name: 'code')
  final String countryCode;

  CountryData(this.id, this.countryName, this.countryCode);

  factory CountryData.fromJson(Map<String, dynamic> json) =>
      _$CountryDataFromJson(json);
}
