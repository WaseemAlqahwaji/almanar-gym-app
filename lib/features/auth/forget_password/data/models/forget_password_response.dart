import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final String? message;

  ForgetPasswordResponse({
    required this.message,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
