import 'package:challenger_api_front/models/response/torneo_list_response/torneo_list_response.dart';
import 'package:challenger_api_front/repositories/torneos/torneos_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TorneoRepositoryImpl extends TorneoRepository {
  final Client _httpClient = Client();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<TorneoListResponse> getAllTorneos() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient.get(
        //Uri.parse('http://10.0.2.2:8080/producto/todos'),
        Uri.parse('http://10.0.2.2:8080/torneo/'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      return TorneoListResponse.fromJson(response.body);
    } else {
      throw Exception('Error al obtener los torneos: ${response.reasonPhrase}');
    }
  }
}
