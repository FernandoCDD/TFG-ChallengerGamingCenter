import 'package:challenger_api_front/blocs/products/products_bloc.dart';
import 'package:challenger_api_front/repositories/products/product_repo.dart';
import 'package:challenger_api_front/repositories/products/product_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/shopping_cart_page.dart';
import 'package:challenger_api_front/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late ProductRepository _productRepository;
  late ProductsBloc _productsBloc;
  bool isPressed = false;

  @override
  void initState() {
    _productRepository = ProductRepositoryImpl();
    _productsBloc = ProductsBloc(_productRepository)..add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Productos'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShoppingCartPage()));
              },
            )
          ],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is DoProductsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE96C26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Todos',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Funko-Pops',
                                style: TextStyle(color: Color(0xFFE96C26))),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Periféricos',
                                style: TextStyle(color: Color(0xFFE96C26))),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 8.0)),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE96C26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Filtrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 120.0, right: 5.0, top: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar...',
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  onChanged: (value) {
                                    // Lógica para búsqueda
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.content!.length,
                        itemBuilder: (context, index) {
                          final producto = state.products.content![index];
                          return ItemCard(productos: producto, index: index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DoProductsError) {
              return Text('Algo ha fallado... ${state.errorMessage}');
            } else if (state is DoProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
