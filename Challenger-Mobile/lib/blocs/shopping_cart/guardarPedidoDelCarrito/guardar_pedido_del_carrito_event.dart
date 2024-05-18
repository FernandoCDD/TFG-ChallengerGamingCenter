part of 'guardar_pedido_del_carrito_bloc.dart';

@immutable
sealed class GuardarPedidoDelCarritoEvent {}

class DoGuardarPedidoDelCarrito extends GuardarPedidoDelCarritoEvent {

  DoGuardarPedidoDelCarrito();
}
