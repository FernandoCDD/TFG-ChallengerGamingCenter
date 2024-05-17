part of 'eliminar_producto_del_carrito_bloc.dart';

@immutable
sealed class EliminarProductoDelCarritoState {}

final class EliminarProductoDelCarritoInitial extends EliminarProductoDelCarritoState {}

final class EliminarProductoDelCarritoLoading extends EliminarProductoDelCarritoState {}

final class EliminarProductoDelCarritoSuccess extends EliminarProductoDelCarritoState {
  final ShoppingCartResponse shoppingCart;

  EliminarProductoDelCarritoSuccess(this.shoppingCart);
}

final class EliminarProductoDelCarritoError extends EliminarProductoDelCarritoState {
  final String errorMessage;
  EliminarProductoDelCarritoError(this.errorMessage);
}
