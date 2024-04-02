part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class GetProductDetailEvent extends ProductDetailEvent {
  final String productId;

  GetProductDetailEvent(this.productId);
}
