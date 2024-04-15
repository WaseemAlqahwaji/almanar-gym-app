import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_state.dart';
part 'core_cubit.freezed.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(const CoreState.initial());

    List<String> countryList = [
    "EG",
    "US",
    "CA",
    "FR",
    "DE",
    "IT",
    "ES",
    "GB",
    "JP",
    "AU",
    "PT",
    "IN",
    "NL",
    "NZ",
    "SG",
  ];
}
