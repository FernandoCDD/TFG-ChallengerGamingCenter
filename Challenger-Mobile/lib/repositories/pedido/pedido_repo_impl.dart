import 'package:challenger_api_front/models/response/pedido_response.dart';
import 'package:challenger_api_front/repositories/pedido/pedido_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PedidoRepositoryImpl extends PedidoRepository {
  final Client _httpClient = Client();

  @override
  Future<PedidoResponse> guardarPedidoDelCarrito() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient.post(
        Uri.parse('http://10.0.2.2:8080/pedido/guardarPedido'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 201) {
      return PedidoResponse.fromJson(response.body);
    } else {
      throw Exception('Error al guardar el pedido: ${response.reasonPhrase}');
    }
  }
}
