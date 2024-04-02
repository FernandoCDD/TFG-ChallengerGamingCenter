import 'package:challenger_api_front/models/response/product_detail_response/product_detail_response.dart';

abstract class ProductDetailRepository {
  Future<ProductDetailResponse> getProductDetail(String productId);
}
