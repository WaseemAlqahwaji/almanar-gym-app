import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'training_state.dart';
part 'training_cubit.freezed.dart';

@singleton
class TrainingCubit extends Cubit<TrainingState> {
  TrainingCubit() : super(const TrainingState.initial());
  int trainingDays = 7;

  /// Get all training days for each training day
}
