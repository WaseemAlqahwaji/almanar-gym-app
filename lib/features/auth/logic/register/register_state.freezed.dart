// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registerLoadaing,
    required TResult Function(T data) registerSuccess,
    required TResult Function(String error) registerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registerLoadaing,
    TResult? Function(T data)? registerSuccess,
    TResult? Function(String error)? registerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registerLoadaing,
    TResult Function(T data)? registerSuccess,
    TResult Function(String error)? registerFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RegisterLoadaing<T> value) registerLoadaing,
    required TResult Function(RegisterSuccess<T> value) registerSuccess,
    required TResult Function(RegisterFailure<T> value) registerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult? Function(RegisterSuccess<T> value)? registerSuccess,
    TResult? Function(RegisterFailure<T> value)? registerFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult Function(RegisterSuccess<T> value)? registerSuccess,
    TResult Function(RegisterFailure<T> value)? registerFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<T, $Res> {
  factory $RegisterStateCopyWith(
          RegisterState<T> value, $Res Function(RegisterState<T>) then) =
      _$RegisterStateCopyWithImpl<T, $Res, RegisterState<T>>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<T, $Res, $Val extends RegisterState<T>>
    implements $RegisterStateCopyWith<T, $Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registerLoadaing,
    required TResult Function(T data) registerSuccess,
    required TResult Function(String error) registerFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registerLoadaing,
    TResult? Function(T data)? registerSuccess,
    TResult? Function(String error)? registerFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registerLoadaing,
    TResult Function(T data)? registerSuccess,
    TResult Function(String error)? registerFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RegisterLoadaing<T> value) registerLoadaing,
    required TResult Function(RegisterSuccess<T> value) registerSuccess,
    required TResult Function(RegisterFailure<T> value) registerFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult? Function(RegisterSuccess<T> value)? registerSuccess,
    TResult? Function(RegisterFailure<T> value)? registerFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult Function(RegisterSuccess<T> value)? registerSuccess,
    TResult Function(RegisterFailure<T> value)? registerFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements RegisterState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$RegisterLoadaingImplCopyWith<T, $Res> {
  factory _$$RegisterLoadaingImplCopyWith(_$RegisterLoadaingImpl<T> value,
          $Res Function(_$RegisterLoadaingImpl<T>) then) =
      __$$RegisterLoadaingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RegisterLoadaingImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterLoadaingImpl<T>>
    implements _$$RegisterLoadaingImplCopyWith<T, $Res> {
  __$$RegisterLoadaingImplCopyWithImpl(_$RegisterLoadaingImpl<T> _value,
      $Res Function(_$RegisterLoadaingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoadaingImpl<T> implements RegisterLoadaing<T> {
  const _$RegisterLoadaingImpl();

  @override
  String toString() {
    return 'RegisterState<$T>.registerLoadaing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadaingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registerLoadaing,
    required TResult Function(T data) registerSuccess,
    required TResult Function(String error) registerFailure,
  }) {
    return registerLoadaing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registerLoadaing,
    TResult? Function(T data)? registerSuccess,
    TResult? Function(String error)? registerFailure,
  }) {
    return registerLoadaing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registerLoadaing,
    TResult Function(T data)? registerSuccess,
    TResult Function(String error)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerLoadaing != null) {
      return registerLoadaing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RegisterLoadaing<T> value) registerLoadaing,
    required TResult Function(RegisterSuccess<T> value) registerSuccess,
    required TResult Function(RegisterFailure<T> value) registerFailure,
  }) {
    return registerLoadaing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult? Function(RegisterSuccess<T> value)? registerSuccess,
    TResult? Function(RegisterFailure<T> value)? registerFailure,
  }) {
    return registerLoadaing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult Function(RegisterSuccess<T> value)? registerSuccess,
    TResult Function(RegisterFailure<T> value)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerLoadaing != null) {
      return registerLoadaing(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadaing<T> implements RegisterState<T> {
  const factory RegisterLoadaing() = _$RegisterLoadaingImpl<T>;
}

/// @nodoc
abstract class _$$RegisterSuccessImplCopyWith<T, $Res> {
  factory _$$RegisterSuccessImplCopyWith(_$RegisterSuccessImpl<T> value,
          $Res Function(_$RegisterSuccessImpl<T>) then) =
      __$$RegisterSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$RegisterSuccessImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterSuccessImpl<T>>
    implements _$$RegisterSuccessImplCopyWith<T, $Res> {
  __$$RegisterSuccessImplCopyWithImpl(_$RegisterSuccessImpl<T> _value,
      $Res Function(_$RegisterSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RegisterSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$RegisterSuccessImpl<T> implements RegisterSuccess<T> {
  const _$RegisterSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RegisterState<$T>.registerSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterSuccessImplCopyWith<T, _$RegisterSuccessImpl<T>> get copyWith =>
      __$$RegisterSuccessImplCopyWithImpl<T, _$RegisterSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registerLoadaing,
    required TResult Function(T data) registerSuccess,
    required TResult Function(String error) registerFailure,
  }) {
    return registerSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registerLoadaing,
    TResult? Function(T data)? registerSuccess,
    TResult? Function(String error)? registerFailure,
  }) {
    return registerSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registerLoadaing,
    TResult Function(T data)? registerSuccess,
    TResult Function(String error)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerSuccess != null) {
      return registerSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RegisterLoadaing<T> value) registerLoadaing,
    required TResult Function(RegisterSuccess<T> value) registerSuccess,
    required TResult Function(RegisterFailure<T> value) registerFailure,
  }) {
    return registerSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult? Function(RegisterSuccess<T> value)? registerSuccess,
    TResult? Function(RegisterFailure<T> value)? registerFailure,
  }) {
    return registerSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult Function(RegisterSuccess<T> value)? registerSuccess,
    TResult Function(RegisterFailure<T> value)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerSuccess != null) {
      return registerSuccess(this);
    }
    return orElse();
  }
}

abstract class RegisterSuccess<T> implements RegisterState<T> {
  const factory RegisterSuccess(final T data) = _$RegisterSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$RegisterSuccessImplCopyWith<T, _$RegisterSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterFailureImplCopyWith<T, $Res> {
  factory _$$RegisterFailureImplCopyWith(_$RegisterFailureImpl<T> value,
          $Res Function(_$RegisterFailureImpl<T>) then) =
      __$$RegisterFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RegisterFailureImplCopyWithImpl<T, $Res>
    extends _$RegisterStateCopyWithImpl<T, $Res, _$RegisterFailureImpl<T>>
    implements _$$RegisterFailureImplCopyWith<T, $Res> {
  __$$RegisterFailureImplCopyWithImpl(_$RegisterFailureImpl<T> _value,
      $Res Function(_$RegisterFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RegisterFailureImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterFailureImpl<T> implements RegisterFailure<T> {
  const _$RegisterFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'RegisterState<$T>.registerFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterFailureImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterFailureImplCopyWith<T, _$RegisterFailureImpl<T>> get copyWith =>
      __$$RegisterFailureImplCopyWithImpl<T, _$RegisterFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registerLoadaing,
    required TResult Function(T data) registerSuccess,
    required TResult Function(String error) registerFailure,
  }) {
    return registerFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registerLoadaing,
    TResult? Function(T data)? registerSuccess,
    TResult? Function(String error)? registerFailure,
  }) {
    return registerFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registerLoadaing,
    TResult Function(T data)? registerSuccess,
    TResult Function(String error)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerFailure != null) {
      return registerFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RegisterLoadaing<T> value) registerLoadaing,
    required TResult Function(RegisterSuccess<T> value) registerSuccess,
    required TResult Function(RegisterFailure<T> value) registerFailure,
  }) {
    return registerFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult? Function(RegisterSuccess<T> value)? registerSuccess,
    TResult? Function(RegisterFailure<T> value)? registerFailure,
  }) {
    return registerFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RegisterLoadaing<T> value)? registerLoadaing,
    TResult Function(RegisterSuccess<T> value)? registerSuccess,
    TResult Function(RegisterFailure<T> value)? registerFailure,
    required TResult orElse(),
  }) {
    if (registerFailure != null) {
      return registerFailure(this);
    }
    return orElse();
  }
}

abstract class RegisterFailure<T> implements RegisterState<T> {
  const factory RegisterFailure(final String error) = _$RegisterFailureImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$RegisterFailureImplCopyWith<T, _$RegisterFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
