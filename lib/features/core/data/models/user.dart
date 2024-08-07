import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final UserData user;
  final String token;

  User({
    required this.token,
    required this.user,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}

@JsonSerializable()
class UserData {
  final String email;
  final UserProfile profile;
  @JsonKey(name: "is_confirmed")
  final int isConfirmed;

  const UserData(
    this.isConfirmed, {
    required this.email,
    required this.profile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
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
