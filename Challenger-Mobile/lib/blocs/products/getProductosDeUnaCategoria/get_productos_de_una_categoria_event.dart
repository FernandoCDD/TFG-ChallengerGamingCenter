part of 'get_productos_de_una_categoria_bloc.dart';

@immutable
sealed class GetProductosDeUnaCategoriaEvent {}

class DoGetProductosDeUnaCategoriaEvent extends GetProductosDeUnaCategoriaEvent {
  final String category;

  DoGetProductosDeUnaCategoriaEvent(this.category);
}
