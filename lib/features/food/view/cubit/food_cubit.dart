import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_state.dart';
part 'food_cubit.freezed.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(const FoodState.initial());
  int foodDays = 7;
}
