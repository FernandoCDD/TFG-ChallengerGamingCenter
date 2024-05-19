part of 'guardar_pedido_del_carrito_bloc.dart';

@immutable
sealed class GuardarPedidoDelCarritoState {}

final class GuardarPedidoDelCarritoInitial
    extends GuardarPedidoDelCarritoState {}

final class GuardarPedidoDelCarritoLoading
    extends GuardarPedidoDelCarritoState {}

final class GuardarPedidoDelCarritoSuccess
    extends GuardarPedidoDelCarritoState {
  final PedidoResponse pedido;

  GuardarPedidoDelCarritoSuccess(this.pedido);
}

final class GuardarPedidoDelCarritoError extends GuardarPedidoDelCarritoState {
  final String message;

  GuardarPedidoDelCarritoError(this.message);
}
