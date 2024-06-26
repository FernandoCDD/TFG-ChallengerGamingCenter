import 'package:challenger_api_front/models/response/product_detail_response/product_detail_response.dart';
import 'package:challenger_api_front/repositories/product_detail/product_detail_repo.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductoDetailRepositoryImpl extends ProductDetailRepository {
  final Client _httpClient = Client();

  @override
  Future<ProductDetailResponse> getProductDetail(String productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await _httpClient.get(
        //Uri.parse('http://10.0.2.2:8080/producto/detail/$productId'),
        Uri.parse('http://10.0.2.2:8080/producto/detail/$productId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      return ProductDetailResponse.fromJson(response.body);
    } else {
      throw Exception(
          'Error al obtener los detalles del producto: ${response.reasonPhrase}');
    }
  }
}
