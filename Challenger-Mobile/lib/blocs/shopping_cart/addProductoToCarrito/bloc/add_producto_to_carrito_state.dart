part of 'add_producto_to_carrito_bloc.dart';

@immutable
sealed class AddProductoToCarritoState {}

final class AddProductoToCarritoInitial extends AddProductoToCarritoState {}

final class AddProductoToCarritoLoading extends AddProductoToCarritoState {}

final class AddProductoToCarritoSuccess extends AddProductoToCarritoState {
  final ShoppingCartResponse shoppingCart;

  AddProductoToCarritoSuccess(this.shoppingCart);
}

final class AddProductoToCarritoError extends AddProductoToCarritoState {
  final String errorMessage;

  AddProductoToCarritoError(this.errorMessage);
}
