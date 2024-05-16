import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/shopping_cart_response/shopping_cart_response.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:meta/meta.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository shoppingCartRepository;

  ShoppingCartBloc(this.shoppingCartRepository) : super(ShoppingCartInitial()) {
    on<ShoppingCartEvent>(_doGetShoppingCart);
  }

  void _doGetShoppingCart(
      ShoppingCartEvent event, Emitter<ShoppingCartState> emit) async {
    emit(DoShoppingCartLoading());

    try {
      final response = await shoppingCartRepository.getCarrito();
      emit(DoShoppingCartSuccess(response));
    } on Exception catch (e) {
      emit(DoShoppingCartError(e.toString()));
    }
  }

}
