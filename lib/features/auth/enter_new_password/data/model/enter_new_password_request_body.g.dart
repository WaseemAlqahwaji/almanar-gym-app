// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enter_new_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnterNewPasswordRequestBody _$EnterNewPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    EnterNewPasswordRequestBody(
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$EnterNewPasswordRequestBodyToJson(
        EnterNewPasswordRequestBody instance) =>
    <String, dynamic>{
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
    };
