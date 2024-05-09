import 'package:challenger_api_front/models/response/shopping_cart_response/shopping_cart_response.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartRepoImpl extends ShoppingCartRepository {
  final Client _httpClient = Client();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<ShoppingCartResponse> getCarrito() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient.get(
        //Uri.parse('http://localhost:8080/producto/todos'),
        Uri.parse('http://localhost:8080/pedido/carrito'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      return ShoppingCartResponse.fromJson(response.body);
    } else {
      throw Exception(
          'Error al obtener los productos: ${response.reasonPhrase}');
    }
  }
}
