import 'package:challenger_api_front/models/response/shopping_cart_response/shopping_cart_response.dart';

abstract class ShoppingCartRepository {
  Future<ShoppingCartResponse> getCarrito();
  Future<ShoppingCartResponse> addProductoToCarrito(String productId);
  Future<ShoppingCartResponse> eliminarProductoDelCarrito(String productId);
}
