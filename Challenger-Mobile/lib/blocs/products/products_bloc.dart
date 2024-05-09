import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/product_list_response/product_list_response.dart';
import 'package:challenger_api_front/models/response/products_response.dart';
import 'package:challenger_api_front/repositories/products/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productsRepository;

  ProductsBloc(this.productsRepository) : super(ProductsInitial()) {
    on<GetProductsEvent>(_doGetProducts);
  }

  void _doGetProducts(
      GetProductsEvent event, Emitter<ProductsState> emit) async {
    emit(DoProductsLoading());

    try {
      final response = await productsRepository.getAllProducts();
      emit(DoProductsSuccess(response));
    } on Exception catch (e) {
      emit(DoProductsError(e.toString()));
    }
  }
}
