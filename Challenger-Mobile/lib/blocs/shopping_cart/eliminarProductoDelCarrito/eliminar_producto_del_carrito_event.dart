part of 'eliminar_producto_del_carrito_bloc.dart';

@immutable
sealed class EliminarProductoDelCarritoEvent {}

final class DoEliminarProductoDelCarritoEvent extends EliminarProductoDelCarritoEvent {
  final String productId;

  DoEliminarProductoDelCarritoEvent(this.productId);
}
