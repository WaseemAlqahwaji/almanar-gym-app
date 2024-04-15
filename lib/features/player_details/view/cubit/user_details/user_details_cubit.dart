import 'package:almanar_application/features/core/domain/enums/body_type.dart';
import 'package:almanar_application/features/core/domain/enums/player_goal.dart';
import 'package:almanar_application/features/core/domain/enums/practicing_habit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_details_state.dart';

part 'user_details_cubit.freezed.dart';

@singleton
class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(const UserDetailsState.initial());

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
  TextEditingController cityNameController = TextEditingController();
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
      if (playerFormsDetailsKey.currentState!.validate()) {
        emit(const UserDetailsState.backButtonAppear());
        currentIndex++;
        userDetailsPageController.jumpToPage(currentIndex);
        return false;
      } else {
        return false;
      }
    } else if (currentIndex < pageCount! - 1) {
      currentIndex++;
      userDetailsPageController.jumpToPage(currentIndex);
      return false;
    }
    if (currentIndex == (pageCount! - 1) && haveInjuries!) {
      if (injuriesKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  void selectBodyType(BodyType bodyType) {
    if (bodyType != playerBodyType) {
      playerBodyType = bodyType;
    }
  }
}
