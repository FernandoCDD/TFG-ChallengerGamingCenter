import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo._impl.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenger_api_front/blocs/shopping_cart/shopping_cart_bloc.dart';
import 'package:challenger_api_front/ui/widgets/item_card_carrito.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late ShoppingCartBloc _shoppingCartBloc;
  late ShoppingCartRepository _shoppingCartRepository;

  @override
  void initState() {
    _shoppingCartRepository = ShoppingCartRepoImpl();
    _shoppingCartBloc = ShoppingCartBloc(_shoppingCartRepository)
      ..add(GetShoppingCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _shoppingCartBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carrito'),
          centerTitle: true,
        ),
        body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
          builder: (context, state) {
            if (state is DoShoppingCartLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DoShoppingCartSuccess) {
              final shoppingCart = state.shoppingCart;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: shoppingCart.lineasPedido!.length,
                      itemBuilder: (context, index) {
                        final lineaPedido = shoppingCart.lineasPedido![index];
                        return ItemCardCarrito(lineasPedido: lineaPedido);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total: ${shoppingCart.total}€',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 102, 0),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
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
                            // Aquí puedes manejar la lógica para el botón
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Finalizar compra',
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is DoShoppingCartError) {
              return Center(
                child: Text('Algo ha fallado... ${state.errorMessage}'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}