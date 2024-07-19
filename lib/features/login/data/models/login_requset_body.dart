import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_requset_body.g.dart';

@JsonSerializable()
class LoginRequsetBody {
  final String? email;
  final String? password;

  LoginRequsetBody({
    required this.email,
    required this.password,
  });

  factory LoginRequsetBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequsetBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequsetBodyToJson(this);
}
