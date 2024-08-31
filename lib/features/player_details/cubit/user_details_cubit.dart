import 'package:almanar_application/features/core/domain/enums/body_type.dart';
import 'package:almanar_application/features/core/domain/enums/player_goal.dart';
import 'package:almanar_application/features/core/domain/enums/practicing_habit.dart';
import 'package:almanar_application/features/player_details/data/model/edit_profile_request_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/edit_profile_repo.dart';
import '../data/repo/get_countries_repo.dart';
import 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final GetCountriesRepo _getCountriesRepo;
  final EditProfileRepo _editProfileRepo;
  UserDetailsCubit(
    this._getCountriesRepo,
    this._editProfileRepo,
  ) : super(const UserDetailsState.initial());

  /// UserDetailsLayout UI Logic
  int currentIndex = 0;
  GlobalKey<FormState> playerFormsDetailsKey = GlobalKey<FormState>();
  PageController userDetailsPageController = PageController();

  GlobalKey<FormState> injuriesKey = GlobalKey<FormState>();
  final TextEditingController injuriesController = TextEditingController();
  int? pageCount;

  /// Player Details with initial values
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  int selectedCountryId = 0;
  TextEditingController phoneController = TextEditingController();
  bool isMale = true;
  int playerAge = 18;
  int playerWeight = 40;
  int playerTall = 140;
  BodyType playerBodyType = BodyType.ectomorph;
  PracticingHabit practicingHabit = PracticingHabit.organizedTwoMonth;
  int playerTrainingsDays = 1;
  PlayerGoal playerGoal = PlayerGoal.increaseWeight;
  bool? haveInjuries = false;

  void backAction() {
    if (currentIndex > 0) {
      currentIndex--;
      userDetailsPageController.jumpToPage(currentIndex);
      if (currentIndex == 0) {
        emit(const UserDetailsState.backButtonHidden());
      }
    }
  }

  // boolean return true if the player in the last screen and pressed the button
  // so it will navigate to HomeScreen
  bool contAction() {
    if (currentIndex == 0) {
      final isValid = playerFormsDetailsKey.currentState?.validate() ?? false;
      if (isValid) {
        emit(const UserDetailsState.backButtonAppear());
        currentIndex++;
        userDetailsPageController.jumpToPage(currentIndex);
      }
      return false;
    }
    if (currentIndex < pageCount! - 1) {
      currentIndex++;
      userDetailsPageController.jumpToPage(currentIndex);
      return false;
    }
    if (currentIndex == pageCount! - 1 && haveInjuries!) {
      return injuriesKey.currentState?.validate() ?? false;
    }
    return true;
  }

  void selectBodyType(BodyType bodyType) {
    if (bodyType != playerBodyType) {
      playerBodyType = bodyType;
    }
  }

  void emitGetCountryState() async {
    emit(const UserDetailsState.getCountriesLoading());
    final response = await _getCountriesRepo.getCountries();
    response.whenOrNull(success: (countryData) async {
      emit(UserDetailsState.getCountriesSuccess(countryData));
    }, failure: (error) {
      emit(UserDetailsState.getCountriesFaliure(
          error.apiErrorModel.message ?? ""));
    });
  }

  void _emitEditProfileState(
      EditProfileRequestBody editProfileRequestBody) async {
    emit(const UserDetailsState.editProfileLoading());
    final response = await _editProfileRepo.editProfile(editProfileRequestBody);
    response.whenOrNull(success: (user) async {
      emit(UserDetailsState.editProfileSuccess(user));
    }, failure: (error) {
      emit(UserDetailsState.editProfileFaliure(
          error.apiErrorModel.message ?? ""));
    });
  }

  void editProfile() {
    _emitEditProfileState(
      EditProfileRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        birthdate: playerAge.toString(),
        gender: isMale ? "ذكر" : "أنثى",
        cityId: selectedCountryId.toString(),
        phone: phoneController.text,
        weight: playerWeight.toString(),
        tall: playerTall.toString(),
        bodyNature: playerBodyType.name,
        sportPractice: practicingHabit.name,
        practiceDaysNumber: playerTrainingsDays.toString(),
        target: playerGoal.name,
        injuries: injuriesController.text,
      ),
    );
  }
}
