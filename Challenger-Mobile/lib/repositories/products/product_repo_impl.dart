import 'package:challenger_api_front/models/response/product_list_response/product_list_response.dart';
import 'package:challenger_api_front/repositories/products/product_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepositoryImpl extends ProductRepository {
  final Client _httpClient = Client();

  @override
  Future<ProductListResponse> getAllProducts() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');

    final response = await _httpClient.get(
        //Uri.parse('http://localhost:8080/producto/todos'),
        Uri.parse('http://localhost:8080/producto/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      return ProductListResponse.fromJson(response.body);
    } else {
      throw Exception(
          'Error al obtener los productos: ${response.reasonPhrase}');
    }
  }
}
