part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class DoProductDetailLoading extends ProductDetailState {}

final class DoProductDetailSuccess extends ProductDetailState {
  final ProductDetailResponse productDetail;

  DoProductDetailSuccess(this.productDetail);
}

final class DoProductDetailError extends ProductDetailState {
  final String errorMessage;

  DoProductDetailError(this.errorMessage);
}
