import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_state.dart';
part 'training_cubit.freezed.dart';

class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit() : super(const TrainingState.initial());
  int trainingDays = 7;

  final Map<int, String> daysTitle = {
    0: "اليوم الأول",
    1: "اليوم الثاني",
    2: "اليوم الثالث",
    3: "اليوم الرابع",
    4: "اليوم الخامس",
    5: "اليوم السادس",
    6: "اليوم السابع",
  };

  /// Get all training days for each training day
}
