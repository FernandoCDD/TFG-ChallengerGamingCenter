
import 'dart:convert';

import 'package:challenger_api_front/models/dto/new_reserva_dto.dart';
import 'package:challenger_api_front/models/response/reserva_response.dart';
import 'package:challenger_api_front/repositories/reservas/reservas_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservaRepositoryImpl implements ReservaRepository {
  final Client _httpClient = Client();

  @override
  Future<ReservaResponse> addReserva(NewReservaDto newReservaDto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    
    final response = await _httpClient.post(Uri.parse('http://10.0.2.2:8080/reserva/nuevaReserva'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(newReservaDto.toJson()));

    if (response.statusCode == 201) {
      return ReservaResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to add reserva');
    }
  }
}