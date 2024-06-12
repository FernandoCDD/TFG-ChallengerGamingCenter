part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class DoChangePasswordLoading extends ChangePasswordState {}

final class DoChangePasswordSuccess extends ChangePasswordState {
  final MyProfileResponse myProfileResponse;
  DoChangePasswordSuccess(this.myProfileResponse);
}

final class DoChangePasswordError extends ChangePasswordState {
  final String errorMessage;
  DoChangePasswordError(this.errorMessage);
}
