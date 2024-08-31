// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetPasswordRequestBody _$VerifyResetPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerifyResetPasswordRequestBody(
      email: json['email'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyResetPasswordRequestBodyToJson(
        VerifyResetPasswordRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
