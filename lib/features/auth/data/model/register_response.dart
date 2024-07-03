import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final User user;
  RegisterResponse({
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class User {
  final String email;
  final UserProfile profile;
  @JsonKey(name: "is_confirmed")
  final bool isConfirmed;

  const User(
    this.isConfirmed, {
    required this.email,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class UserProfile {
  final int id;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  final String? birthdate;
  final String? gender;
  final String? city;
  final String? phone;
  final double? weight;
  final double? tall;
  @JsonKey(name: "sport_practice")
  final String? sportPractice;
  @JsonKey(name: "practice_days_number")
  final int? practiceDaysNumber;
  final String? target;
  @JsonKey(name: "profile_image")
  final String? profileImage;
  final List<String>? injuries;

  UserProfile({
    required this.id,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.gender,
    this.city,
    this.phone,
    this.weight,
    this.tall,
    this.sportPractice,
    this.practiceDaysNumber,
    this.target,
    this.profileImage,
    this.injuries,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
