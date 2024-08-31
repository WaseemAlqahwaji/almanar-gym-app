import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_state.freezed.dart';
@freezed
class UserDetailsState<T> with _$UserDetailsState<T> {
  const factory UserDetailsState.initial() = _Initial;
  const factory UserDetailsState.backButtonHidden() = BackButtonHidden;
  const factory UserDetailsState.backButtonAppear() = BackButtonAppear;

  const factory UserDetailsState.getCountriesLoading() = GetCountriesLoading;
  const factory UserDetailsState.getCountriesSuccess(T data) = GetCountriesSuccess<T>;
  const factory UserDetailsState.getCountriesFaliure(String error) = GetCountriesFaliure<T>;

  const factory UserDetailsState.editProfileLoading() = EditProfileLoading;
  const factory UserDetailsState.editProfileSuccess(T data) = EditProfileSuccess<T>;
  const factory UserDetailsState.editProfileFaliure(String error) = EditProfileFaliure<T>;
}
