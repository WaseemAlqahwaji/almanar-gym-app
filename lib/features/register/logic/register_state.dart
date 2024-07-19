import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@Freezed()
class RegisterState<T> with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.registerLoading() = RegisterLoadaing;
  const factory RegisterState.registerSuccess(T data) = RegisterSuccess<T>;
  const factory RegisterState.registerFailure(String error) = RegisterFailure;
  const factory RegisterState.verifiedAccountLoading() = VerifiedAccountLoading;
  const factory RegisterState.verifiedAccountSuccess(T data) = VerifiedAccountSuccess<T>;
  const factory RegisterState.verifiedAccountFailure(String error) = VerifiedAccountFailure;
}
