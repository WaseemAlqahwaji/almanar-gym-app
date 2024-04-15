import 'package:almanar_application/features/core/domain/enums/subscription_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'subscription_state.dart';
part 'subscription_cubit.freezed.dart';

@lazySingleton
class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(const SubscriptionState.initial());
  SubscriptionType? subscriptionType = SubscriptionType.training;
}
