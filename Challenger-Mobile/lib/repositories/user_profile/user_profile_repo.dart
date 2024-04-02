import 'package:challenger_api_front/models/dto/change_password_dto.dart';
import 'package:challenger_api_front/models/response/my_profile_response.dart';

abstract class UserProfileRepository {
  Future<MyProfileResponse> userDetails();
  Future<MyProfileResponse> changePassword(ChangePasswordDto changePasswordDto);
}
