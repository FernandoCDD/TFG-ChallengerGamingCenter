part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitial extends UserProfileState {}

final class DoUserProfileLoading extends UserProfileState {}

final class DoUserProfileSuccess extends UserProfileState {
  final MyProfileResponse myProfileResponse;
  DoUserProfileSuccess(this.myProfileResponse);
}

final class DoUserProfileError extends UserProfileState {
  final String errorMessage;
  DoUserProfileError(this.errorMessage);
}
