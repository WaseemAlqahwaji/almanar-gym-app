import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_new_password_request_body.g.dart';

@JsonSerializable()
class EnterNewPasswordRequestBody {
  final String password;
  @JsonKey(name: "password_confirmation")
  final String confirmPassword;

  EnterNewPasswordRequestBody({
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$EnterNewPasswordRequestBodyToJson(this);
}
