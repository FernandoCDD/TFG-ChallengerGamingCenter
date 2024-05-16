import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/shopping_cart_response/shopping_cart_response.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:meta/meta.dart';

part 'add_producto_to_carrito_event.dart';
part 'add_producto_to_carrito_state.dart';

class AddProductoToCarritoBloc extends Bloc<AddProductoToCarritoEvent, AddProductoToCarritoState> {

  final ShoppingCartRepository shoppingCartRepository;
  
  AddProductoToCarritoBloc(this.shoppingCartRepository) : super(AddProductoToCarritoInitial()) {
    on<DoAddProductoToCarritoEvent>(_doAddProductoToCarrito); {
    };
  }

  void _doAddProductoToCarrito(
    DoAddProductoToCarritoEvent event, Emitter<AddProductoToCarritoState> emit) async {
    emit(AddProductoToCarritoLoading());

    try {
      final response = await shoppingCartRepository.addProductoToCarrito(event.productId);
      emit(AddProductoToCarritoSuccess(response));
    } on Exception catch (e) {
      emit(AddProductoToCarritoError(e.toString()));
    }
  }
}
