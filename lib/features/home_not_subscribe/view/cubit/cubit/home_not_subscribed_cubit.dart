import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_not_subscribed_state.dart';
part 'home_not_subscribed_cubit.freezed.dart';

@singleton
class HomeNotSubscribedCubit extends Cubit<HomeNotSubscribedState> {
  HomeNotSubscribedCubit() : super(const HomeNotSubscribedState.initial());
  int currentIndex = 0;
}
