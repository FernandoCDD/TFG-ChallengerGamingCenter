import 'package:challenger_api_front/blocs/shopping_cart/addProductoToCarrito/bloc/add_producto_to_carrito_bloc.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo._impl.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenger_api_front/blocs/product_detail/product_detail_bloc.dart';
import 'package:challenger_api_front/repositories/product_detail/product_detail_repo.dart';
import 'package:challenger_api_front/repositories/product_detail/product_detail_repo_impl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ProductDetailRepository _productDetailRepo;
  late ProductDetailBloc _productDetailBloc;
  late AddProductoToCarritoBloc _addProductoToCarritoBloc;
  late ShoppingCartRepository _shoppingCartRepository;

  @override
  void initState() {
    super.initState();
    _productDetailRepo = ProductoDetailRepositoryImpl();
    _productDetailBloc = ProductDetailBloc(_productDetailRepo)..add(GetProductDetailEvent (widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _productDetailBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del Producto'),
          centerTitle: true,
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is DoProductDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DoProductDetailSuccess) {
              final product = state.productDetail;
              return Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: Center(
                      child: Image.network(
                        product.imagen ?? '',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.nombre ?? 'Sin nombre',
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE96C26)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: product.valoracion ?? 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Text(rating as String);
                        },
                      ),
                      Text("(${product.valoracion})",
                          style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    product.descripcion ?? 'Sin descripción',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 255, 102, 0)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            _shoppingCartRepository = ShoppingCartRepoImpl();
                            _addProductoToCarritoBloc = AddProductoToCarritoBloc(_shoppingCartRepository)..add(DoAddProductoToCarritoEvent(widget.productId));
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("¡Producto agregado al carrito!"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 255, 102, 0),
                                      width: 2,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 255, 102, 0))),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Agregar al carrito',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text('${product.precio}€',
                          style: const TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 255, 102, 0),
                              fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.only(right: 16.0)),
                    ],
                  ),
                ],
              );
            } else if (state is DoProductDetailError) {
              return Center(
                child: Text('Error: ${state.errorMessage}'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
