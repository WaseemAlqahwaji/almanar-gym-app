// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestBody _$EditProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      birthdate: json['birthdate'] as String,
      gender: json['gender'] as String,
      cityId: json['city_id'] as String,
      phone: json['phone'] as String,
      weight: json['weight'] as String,
      tall: json['tall'] as String,
      bodyNature: json['body_nature'] as String,
      sportPractice: json['sport_practice'] as String,
      practiceDaysNumber: json['practice_days_number'] as String,
      target: json['target'] as String,
      injuries: json['injuries'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestBodyToJson(
        EditProfileRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'city_id': instance.cityId,
      'phone': instance.phone,
      'weight': instance.weight,
      'tall': instance.tall,
      'body_nature': instance.bodyNature,
      'sport_practice': instance.sportPractice,
      'practice_days_number': instance.practiceDaysNumber,
      'target': instance.target,
      'injuries': instance.injuries,
      'profile_image': instance.profileImage,
    };
