import 'package:json_annotation/json_annotation.dart';
part 'register_requset_body.g.dart';

@JsonSerializable()
class RegisterRequsetBody {
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterRequsetBody({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });


  factory RegisterRequsetBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequsetBodyFromJson(json);
}