import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/product_detail_response/product_detail_response.dart';
import 'package:challenger_api_front/repositories/product_detail/product_detail_repo.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductDetailRepository productDetailRepository;

  ProductDetailBloc(this.productDetailRepository)
      : super(ProductDetailInitial()) {
    on<GetProductDetailEvent>(_doGetProductoDetail);
  }

  void _doGetProductoDetail(
      GetProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    emit(DoProductDetailLoading());

    try {
      final response =
          await productDetailRepository.getProductDetail(event.productId);
      emit(DoProductDetailSuccess(response));
    } on Exception catch (e) {
      emit(DoProductDetailError(e.toString()));
    }
  }
}
