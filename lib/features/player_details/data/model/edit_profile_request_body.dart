import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_request_body.g.dart';

@JsonSerializable()
class EditProfileRequestBody {
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String birthdate;
  final String gender;
  @JsonKey(name: "city_id")
  final String cityId;
  final String phone;
  final String weight;
  final String tall;
  @JsonKey(name: 'body_nature')
  final String bodyNature;
  @JsonKey(name: 'sport_practice')
  final String sportPractice;
  @JsonKey(name: 'practice_days_number')
  final String practiceDaysNumber;
  final String target;
  final String injuries;
  @JsonKey(name: 'profile_image')
  String? profileImage;

  EditProfileRequestBody({
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.gender,
    required this.cityId,
    required this.phone,
    required this.weight,
    required this.tall,
    required this.bodyNature,
    required this.sportPractice,
    required this.practiceDaysNumber,
    required this.target,
    required this.injuries,
    this.profileImage,
  });

  Map<String, dynamic> toJson() => _$EditProfileRequestBodyToJson(this);
}
