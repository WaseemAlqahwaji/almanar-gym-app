import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password_body_request.g.dart';

@JsonSerializable()
class ForgetPasswordBodyRequest {
  final String? email;

  ForgetPasswordBodyRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$ForgetPasswordBodyRequestToJson(this);
}
