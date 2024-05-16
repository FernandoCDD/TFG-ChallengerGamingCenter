import 'dart:convert';

import 'package:challenger_api_front/models/dto/login_dto.dart';
import 'package:challenger_api_front/models/dto/register_dto.dart';
import 'package:challenger_api_front/models/response/login_response.dart';
import 'package:challenger_api_front/models/response/register_response.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo.dart';
import 'package:http/http.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _httpClient = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    // final SharedPreferences prefs = await _prefs;
    final jsonBody = jsonEncode(loginDto.toJson());
    final response = //await _httpClient.post(Uri.parse('http://localhost:8080/auth/login'),
        await _httpClient.post(Uri.parse('http://localhost:8080/auth/login'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonBody);

    if (response.statusCode == 201) {
      return LoginResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<RegisterResponse> register(RegisterDto registerDto) async {
    final jsonBody = jsonEncode(registerDto.toJson());
    final response = //await _httpClient.post(Uri.parse('http://localhost:8080/auth/register'),
        await _httpClient.post(Uri.parse('http://localhost:8080/auth/register'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonBody);

    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }
}
