part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}

class DoChangePasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String verifyPassword;

  DoChangePasswordEvent(
      this.oldPassword, this.newPassword, this.verifyPassword);
}
