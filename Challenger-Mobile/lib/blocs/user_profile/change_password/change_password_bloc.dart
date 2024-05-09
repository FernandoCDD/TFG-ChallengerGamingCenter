import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/dto/change_password_dto.dart';
import 'package:challenger_api_front/models/response/my_profile_response.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UserProfileRepository userProfileRepository;

  ChangePasswordBloc(this.userProfileRepository)
      : super(ChangePasswordInitial()) {
    on<DoChangePasswordEvent>(_doChangePassword);
  }

  void _doChangePassword(
      DoChangePasswordEvent event, Emitter<ChangePasswordState> emit) async {
    emit(DoChangePasswordLoading());

    try {
      final ChangePasswordDto changePasswordDto = ChangePasswordDto(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          verifyPassword: event.verifyPassword);
      final response =
          await userProfileRepository.changePassword(changePasswordDto);
      emit(DoChangePasswordSuccess(response));
    } on Exception catch (e) {
      emit(DoChangePasswordError(e.toString()));
    }
  }
}
