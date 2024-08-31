import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_reset_password_request_body.g.dart';

@JsonSerializable()
class VerifyResetPasswordRequestBody {
  final String email;
  final String code;

  VerifyResetPasswordRequestBody({required this.email, required this.code});

  Map<String, dynamic> toJson() => _$VerifyResetPasswordRequestBodyToJson(this);
}
