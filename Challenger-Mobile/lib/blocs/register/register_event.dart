import 'package:flutter/foundation.dart';

@immutable
sealed class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  final String username;
  final String email;
  final String avatar;
  final String password;
  final String verifyPassword;

  DoRegisterEvent(this.username, this.email, this.avatar, this.password,
      this.verifyPassword);
}
