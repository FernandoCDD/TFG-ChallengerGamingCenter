import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/product_list_response/product_list_response.dart';
import 'package:challenger_api_front/repositories/products/product_repo.dart';
import 'package:meta/meta.dart';

part 'get_productos_de_una_categoria_event.dart';
part 'get_productos_de_una_categoria_state.dart';

class GetProductosDeUnaCategoriaBloc extends Bloc<GetProductosDeUnaCategoriaEvent, GetProductosDeUnaCategoriaState> {
  final ProductRepository productsRepository;
  
  GetProductosDeUnaCategoriaBloc(this.productsRepository) : super(GetProductosDeUnaCategoriaInitial()) {
    on<DoGetProductosDeUnaCategoriaEvent>(_doGetProductosDeUnaCategoria);
  }

  void _doGetProductosDeUnaCategoria(
      DoGetProductosDeUnaCategoriaEvent event, Emitter<GetProductosDeUnaCategoriaState> emit) async {
    emit(DoGetProductosDeUnaCategoriaLoading());

    try {
      final response = await productsRepository.getProductosDeUnaCategoria(event.category);
      emit(DoGetProductosDeUnaCategoriaSuccess(response));
    } on Exception catch (e) {
      emit(DoGetProductosDeUnaCategoriaError(e.toString()));
    }
  }
}
