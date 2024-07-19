// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['is_confirmed'] as num).toInt(),
      email: json['email'] as String,
      profile: UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'profile': instance.profile,
      'is_confirmed': instance.isConfirmed,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthdate: json['birthdate'] as String?,
      gender: json['gender'] as String?,
      city: json['city'] as String?,
      phone: json['phone'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      tall: (json['tall'] as num?)?.toDouble(),
      sportPractice: json['sport_practice'] as String?,
      practiceDaysNumber: (json['practice_days_number'] as num?)?.toInt(),
      target: json['target'] as String?,
      profileImage: json['profile_image'] as String?,
      injuries: (json['injuries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birthdate': instance.birthdate,
      'gender': instance.gender,
      'city': instance.city,
      'phone': instance.phone,
      'weight': instance.weight,
      'tall': instance.tall,
      'sport_practice': instance.sportPractice,
      'practice_days_number': instance.practiceDaysNumber,
      'target': instance.target,
      'profile_image': instance.profileImage,
      'injuries': instance.injuries,
    };
