import 'package:challenger_api_front/models/response/register_response.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class DoRegisterLoading extends RegisterState {}

final class DoRegisterSuccess extends RegisterState {
  final RegisterResponse userRegister;

  DoRegisterSuccess(this.userRegister);
}

final class DoRegisterError extends RegisterState {
  final String errorMessage;
  DoRegisterError(this.errorMessage);
}
