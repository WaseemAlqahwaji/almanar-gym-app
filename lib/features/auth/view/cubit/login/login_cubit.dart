import 'package:flutter_bloc/flutter_bloc.dart';
import "package:freezed_annotation/freezed_annotation.dart";
import 'package:injectable/injectable.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';


@singleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

}
