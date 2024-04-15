part of 'user_details_cubit.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState.initial() = _Initial;
  const factory UserDetailsState.backButtonHidden() = BackButtonHidden;
  const factory UserDetailsState.backButtonAppear() = BackButtonAppear;
}
