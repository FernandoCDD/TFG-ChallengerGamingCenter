part of 'add_producto_to_carrito_bloc.dart';

@immutable
sealed class AddProductoToCarritoEvent {}

class DoAddProductoToCarritoEvent extends AddProductoToCarritoEvent {
  final String productId;

  DoAddProductoToCarritoEvent(this.productId);
}
