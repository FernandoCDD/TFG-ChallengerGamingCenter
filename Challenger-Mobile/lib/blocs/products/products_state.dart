part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class DoProductsLoading extends ProductsState {}

final class DoProductsSuccess extends ProductsState {
  final ProductListResponse products;

  DoProductsSuccess(this.products);
}

final class DoProductsError extends ProductsState {
  final String errorMessage;

  DoProductsError(this.errorMessage);
}
