part of 'get_productos_de_una_categoria_bloc.dart';

@immutable
sealed class GetProductosDeUnaCategoriaState {}

final class GetProductosDeUnaCategoriaInitial extends GetProductosDeUnaCategoriaState {}

final class DoGetProductosDeUnaCategoriaLoading extends GetProductosDeUnaCategoriaState {}

final class DoGetProductosDeUnaCategoriaSuccess extends GetProductosDeUnaCategoriaState {
  final ProductListResponse productListResponse;

  DoGetProductosDeUnaCategoriaSuccess(this.productListResponse);
}

final class DoGetProductosDeUnaCategoriaError extends GetProductosDeUnaCategoriaState {
  final String errorMessage;

  DoGetProductosDeUnaCategoriaError(this.errorMessage);
}


