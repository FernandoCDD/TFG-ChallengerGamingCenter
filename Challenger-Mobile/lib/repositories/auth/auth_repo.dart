import 'package:challenger_api_front/models/dto/login_dto.dart';
import 'package:challenger_api_front/models/dto/register_dto.dart';
import 'package:challenger_api_front/models/response/login_response.dart';
import 'package:challenger_api_front/models/response/register_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RegisterResponse> register(RegisterDto registerDto);
}
