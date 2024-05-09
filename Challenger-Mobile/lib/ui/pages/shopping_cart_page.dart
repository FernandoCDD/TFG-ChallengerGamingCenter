import 'package:challenger_api_front/blocs/shopping_cart/shopping_cart_bloc.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo._impl.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:challenger_api_front/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carrito'),
          centerTitle: true,
        ),
        body: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
          builder: (context, state) {
            if (state is DoShoppingCartSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [                     
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.shoppingCart.lineasPedido!.length,
                        itemBuilder: (context, index) {
                          final producto = state.shoppingCart.lineasPedido![index];
                          return ItemCard(productos: producto, index: index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DoShoppingCartError) {
              return Text('Algo ha fallado... ${state.errorMessage}');
            } else if (state is DoShoppingCartLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),);
  }
}
