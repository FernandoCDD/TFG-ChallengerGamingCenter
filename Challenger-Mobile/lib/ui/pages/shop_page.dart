import 'package:challenger_api_front/blocs/products/getProductosDeUnaCategoria/get_productos_de_una_categoria_bloc.dart';
import 'package:challenger_api_front/blocs/products/products_bloc.dart';
import 'package:challenger_api_front/models/response/product_list_response/product_list_response.dart';
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
  late GetProductosDeUnaCategoriaBloc _getProductosDeUnaCategoriaBloc;
  String _selectedCategory = 'Funko-Pops'; // Inicialmente seleccionamos Funko-Pops

  @override
  void initState() {
    super.initState();
    _productRepository = ProductRepositoryImpl();
    _getProductosDeUnaCategoriaBloc = GetProductosDeUnaCategoriaBloc(_productRepository);
    _getProductosDeUnaCategoriaBloc.add(DoGetProductosDeUnaCategoriaEvent('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0')); // ID de Funko-Pops
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getProductosDeUnaCategoriaBloc,
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
                    builder: (context) => const ShoppingCartPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'Funko-Pops';
                      });
                      _getProductosDeUnaCategoriaBloc.add(DoGetProductosDeUnaCategoriaEvent('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0')); // ID de los Funko-Pops
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCategory == 'Funko-Pops' ? const Color.fromARGB(255, 255, 102, 0) : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Funko-Pops',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'Periféricos';
                      });
                      _getProductosDeUnaCategoriaBloc.add(DoGetProductosDeUnaCategoriaEvent('6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1')); // ID de los Periféricos
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCategory == 'Periféricos' ? const Color.fromARGB(255, 255, 102, 0) : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Periféricos',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<GetProductosDeUnaCategoriaBloc, GetProductosDeUnaCategoriaState>(
                bloc: _getProductosDeUnaCategoriaBloc,
                builder: (context, categoriaState) {
                  if (categoriaState is DoGetProductosDeUnaCategoriaLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (categoriaState is DoGetProductosDeUnaCategoriaSuccess) {
                    return _buildProductList(categoriaState.productListResponse);
                  } else if (categoriaState is DoGetProductosDeUnaCategoriaError) {
                    return Text('Error al cargar productos: ${categoriaState.errorMessage}');
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(ProductListResponse response) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: response.content!.length,
        itemBuilder: (context, index) {
          final producto = response.content![index];
          return ItemCard(productos: producto, index: index);
        },
      ),
    );
  }

  @override
  void dispose() {
    _getProductosDeUnaCategoriaBloc.close();
    super.dispose();
  }
}
