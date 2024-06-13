part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartState {}

final class ShoppingCartInitial extends ShoppingCartState {}

final class DoShoppingCartLoading extends ShoppingCartState {}

final class DoShoppingCartSuccess extends ShoppingCartState {
  final ShoppingCartResponse shoppingCart;

  DoShoppingCartSuccess(this.shoppingCart);
}

final class DoShoppingCartError extends ShoppingCartState {
  final String errorMessage;
  DoShoppingCartError(this.errorMessage);
}
