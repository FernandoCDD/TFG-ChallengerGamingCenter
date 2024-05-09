import 'dart:convert';

import 'lineas_pedido.dart';

class ShoppingCartResponse {
  String? id;
  String? usuario;
  String? fecha;
  String? estadoPedido;
  List<LineasPedido>? lineasPedido;
  double? total;

  ShoppingCartResponse({
    this.id,
    this.usuario,
    this.fecha,
    this.estadoPedido,
    this.lineasPedido,
    this.total,
  });

  factory ShoppingCartResponse.fromMap(Map<String, dynamic> data) {
    return ShoppingCartResponse(
      id: data['id'] as String?,
      usuario: data['usuario'] as String?,
      fecha: data['fecha'] as String?,
      estadoPedido: data['estadoPedido'] as String?,
      lineasPedido: (data['lineasPedido'] as List<dynamic>?)
          ?.map((e) => LineasPedido.fromMap(e as Map<String, dynamic>))
          .toList(),
      total: (data['total'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'usuario': usuario,
        'fecha': fecha,
        'estadoPedido': estadoPedido,
        'lineasPedido': lineasPedido?.map((e) => e.toMap()).toList(),
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ShoppingCartResponse].
  factory ShoppingCartResponse.fromJson(String data) {
    return ShoppingCartResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ShoppingCartResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
