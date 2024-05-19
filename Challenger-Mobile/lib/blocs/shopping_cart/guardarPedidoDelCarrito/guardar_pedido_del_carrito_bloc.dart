import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/pedido_response.dart';
import 'package:challenger_api_front/repositories/pedido/pedido_repo.dart';
import 'package:meta/meta.dart';

part 'guardar_pedido_del_carrito_event.dart';
part 'guardar_pedido_del_carrito_state.dart';

class GuardarPedidoDelCarritoBloc
    extends Bloc<GuardarPedidoDelCarritoEvent, GuardarPedidoDelCarritoState> {
  final PedidoRepository pedidoRepository;

  GuardarPedidoDelCarritoBloc(this.pedidoRepository)
      : super(GuardarPedidoDelCarritoInitial()) {
    on<GuardarPedidoDelCarritoEvent>(_doGuardarPedidoDelCarrito);
  }

  void _doGuardarPedidoDelCarrito(GuardarPedidoDelCarritoEvent event,
      Emitter<GuardarPedidoDelCarritoState> emit) async {
    emit(GuardarPedidoDelCarritoLoading());

    try {
      final response = await pedidoRepository.guardarPedidoDelCarrito();
      emit(GuardarPedidoDelCarritoSuccess(response));
    } on Exception catch (e) {
      emit(GuardarPedidoDelCarritoError(e.toString()));
    }
  }
}
