import 'package:json_annotation/json_annotation.dart';

part 'verify_request_body.g.dart';

@JsonSerializable()
class VerifyRequestBody {
  final String code;

  VerifyRequestBody({
    required this.code,
  });
  Map<String, dynamic> toJson() => _$VerifyRequestBodyToJson(this);
}
