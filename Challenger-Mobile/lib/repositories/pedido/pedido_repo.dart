import 'package:challenger_api_front/models/response/pedido_response.dart';

abstract class PedidoRepository {
  Future<PedidoResponse> guardarPedidoDelCarrito();
}
