import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_new_password_response.g.dart';
@JsonSerializable()
class EnterNewPasswordReponse {
  final String message;

  EnterNewPasswordReponse(this.message);

  
  factory EnterNewPasswordReponse.fromJson(Map<String, dynamic> json) =>
      _$EnterNewPasswordReponseFromJson(json);
}
