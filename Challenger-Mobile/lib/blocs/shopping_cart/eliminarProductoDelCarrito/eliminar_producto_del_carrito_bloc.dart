import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/shopping_cart_response/shopping_cart_response.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:meta/meta.dart';

part 'eliminar_producto_del_carrito_event.dart';
part 'eliminar_producto_del_carrito_state.dart';

class EliminarProductoDelCarritoBloc extends Bloc<EliminarProductoDelCarritoEvent, EliminarProductoDelCarritoState> {

  final ShoppingCartRepository shoppingCartRepository;

  EliminarProductoDelCarritoBloc(this.shoppingCartRepository) : super(EliminarProductoDelCarritoInitial()) {
    on<DoEliminarProductoDelCarritoEvent>(_doEliminarProductoDelCarrito);
  }

  void _doEliminarProductoDelCarrito(
    DoEliminarProductoDelCarritoEvent event, Emitter<EliminarProductoDelCarritoState> emit) async {
      emit(EliminarProductoDelCarritoLoading());

      try {
        final response = await shoppingCartRepository.eliminarProductoDelCarrito(event.productId);
        emit(EliminarProductoDelCarritoSuccess(response));
      } on Exception catch (e) {
        emit(EliminarProductoDelCarritoError(e.toString()));
      }
    }
}

