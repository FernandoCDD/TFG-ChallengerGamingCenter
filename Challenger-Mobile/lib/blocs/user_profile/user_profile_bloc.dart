import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/my_profile_response.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserProfileRepository userProfileRepository;

  UserProfileBloc(this.userProfileRepository) : super(UserProfileInitial()) {
    on<GetUserProfileDetailEvent>(_doUserProfile);
  }

  void _doUserProfile(
      GetUserProfileDetailEvent event, Emitter<UserProfileState> emit) async {
    emit(DoUserProfileLoading());

    try {
      final response = await userProfileRepository.userDetails();
      emit(DoUserProfileSuccess(response));
    } on Exception catch (e) {
      emit(DoUserProfileError(e.toString()));
    }
  }
}
