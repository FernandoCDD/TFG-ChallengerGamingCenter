part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartEvent {}

class GetShoppingCartEvent extends ShoppingCartEvent {
  GetShoppingCartEvent();
}