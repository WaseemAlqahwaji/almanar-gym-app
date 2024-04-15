import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@singleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  int currentIndex = 0;
}
