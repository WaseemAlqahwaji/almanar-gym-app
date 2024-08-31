// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      (json['data'] as List<dynamic>)
          .map((e) => CountryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'data': instance.countryData,
    };

CountryData _$CountryDataFromJson(Map<String, dynamic> json) => CountryData(
      (json['id'] as num).toInt(),
      json['country'] as String,
      json['code'] as String,
    );

Map<String, dynamic> _$CountryDataToJson(CountryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.countryName,
      'code': instance.countryCode,
    };
