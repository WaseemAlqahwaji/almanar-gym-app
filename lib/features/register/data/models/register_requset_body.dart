import 'package:json_annotation/json_annotation.dart';
part 'register_requset_body.g.dart';

@JsonSerializable()
class RegisterRequsetBody {
  final String email;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;

  RegisterRequsetBody({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
      
  Map<String, dynamic> toJson() => _$RegisterRequsetBodyToJson(this);
}