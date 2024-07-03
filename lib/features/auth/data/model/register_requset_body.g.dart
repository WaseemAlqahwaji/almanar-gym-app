// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_requset_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequsetBody _$RegisterRequsetBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequsetBody(
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
    );

Map<String, dynamic> _$RegisterRequsetBodyToJson(
        RegisterRequsetBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
    };
