import 'package:challenger_api_front/models/response/product_list_response/product_list_response.dart';

abstract class ProductRepository {
  Future<ProductListResponse> getAllProducts();
}
