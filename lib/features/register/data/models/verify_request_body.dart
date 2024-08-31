import 'package:json_annotation/json_annotation.dart';

part 'verify_request_body.g.dart';

@JsonSerializable()
class VerifyRegisterRequestBody {
  final String code;

  VerifyRegisterRequestBody({
    required this.code,
  });
  Map<String, dynamic> toJson() => _$VerifyRegisterRequestBodyToJson(this);
}
