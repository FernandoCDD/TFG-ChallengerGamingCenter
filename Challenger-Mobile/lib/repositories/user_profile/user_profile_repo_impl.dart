import 'dart:convert';

import 'package:challenger_api_front/models/dto/change_password_dto.dart';
import 'package:challenger_api_front/models/response/my_profile_response.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileRepositoryImpl extends UserProfileRepository {
  final Client _httpClient = Client();

  @override
  Future<MyProfileResponse> userDetails() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient
        .get(Uri.parse('http://localhost:8080/me'), headers: <String, String>{
      //.get(Uri.parse('http://localhost:8080/me'), headers: <String, String>{
      'Content-Type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final respData = MyProfileResponse.fromJson(json.decode(response.body));
      return respData;
    } else {
      throw Exception(
          'Error al obtener los detalles del usuario: ${response.reasonPhrase}');
    }
  }

  @override
  Future<MyProfileResponse> changePassword(
      ChangePasswordDto changePasswordDto) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient.put(
      //Uri.parse('http://localhost:8080/user/changePassword'),
      Uri.parse('http://localhost:8080/user/changePassword'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(changePasswordDto.toJson()),
    );
    if (response.statusCode == 200) {
      return MyProfileResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cambiar la contraseña: ${response.statusCode}');
    }
  }
}
