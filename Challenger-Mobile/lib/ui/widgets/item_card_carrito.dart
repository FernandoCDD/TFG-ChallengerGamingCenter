import 'package:challenger_api_front/blocs/shopping_cart/eliminarProductoDelCarrito/eliminar_producto_del_carrito_bloc.dart';
import 'package:challenger_api_front/blocs/shopping_cart/shopping_cart_bloc.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo._impl.dart';
import 'package:challenger_api_front/repositories/shopping_cart/shopping_cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenger_api_front/blocs/shopping_cart/addProductoToCarrito/bloc/add_producto_to_carrito_bloc.dart';
import 'package:challenger_api_front/models/response/shopping_cart_response/lineas_pedido.dart';

class ItemCardCarrito extends StatefulWidget {
  final LineasPedido lineasPedido;
  final int index;

  const ItemCardCarrito(
      {Key? key, required this.lineasPedido, required this.index})
      : super(key: key);

  @override
  _ItemCardCarritoState createState() => _ItemCardCarritoState();
}

class _ItemCardCarritoState extends State<ItemCardCarrito> {
  late int _cantidad;
  late AddProductoToCarritoBloc _addProductoToCarritoBloc;
  late EliminarProductoDelCarritoBloc _eliminarProductoDelCarritoBloc;
  late ShoppingCartRepository _shoppingCartRepository;

  @override
  void initState() {
    super.initState();
    _cantidad = widget.lineasPedido.cantidad!;
  }

  void actualizarCarrito() {
    final nuevaCantidad = _cantidad;
    final nuevoSubtotal = widget.lineasPedido.precioUnitario! * nuevaCantidad;

    setState(() {
      widget.lineasPedido.cantidad = nuevaCantidad;
      widget.lineasPedido.subtotal = nuevoSubtotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side:
            const BorderSide(color: Color.fromARGB(255, 255, 102, 0), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.lineasPedido.urlImagen!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.lineasPedido.nombreProducto!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${widget.lineasPedido.precioUnitario!.toString()}€',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 102, 0),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_cantidad > 0) {
                              setState(() {
                                _cantidad--;
                                _shoppingCartRepository =
                                    ShoppingCartRepoImpl();
                                _eliminarProductoDelCarritoBloc =
                                    EliminarProductoDelCarritoBloc(
                                        _shoppingCartRepository)
                                      ..add(DoEliminarProductoDelCarritoEvent(
                                          widget.lineasPedido.idProducto!));
                                actualizarCarrito();
                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          _cantidad.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _cantidad++;
                              _shoppingCartRepository = ShoppingCartRepoImpl();
                              _addProductoToCarritoBloc =
                                  AddProductoToCarritoBloc(
                                      _shoppingCartRepository)
                                    ..add(DoAddProductoToCarritoEvent(
                                        widget.lineasPedido.idProducto!));
                              actualizarCarrito();
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${(widget.lineasPedido.subtotal!).toString()}€',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 102, 0),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
