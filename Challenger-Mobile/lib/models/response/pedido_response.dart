import 'dart:convert';

class PedidoResponse {
  String? idPedido;
  String? fecha;
  String? usuario;
  String? estadoPedido;
  double? importe;

  PedidoResponse({
    this.idPedido,
    this.fecha,
    this.usuario,
    this.estadoPedido,
    this.importe,
  });

  factory PedidoResponse.fromMap(Map<String, dynamic> data) {
    return PedidoResponse(
      idPedido: data['idPedido'] as String?,
      fecha: data['fecha'] as String?,
      usuario: data['usuario'] as String?,
      estadoPedido: data['estadoPedido'] as String?,
      importe: (data['importe'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        'idPedido': idPedido,
        'fecha': fecha,
        'usuario': usuario,
        'estadoPedido': estadoPedido,
        'importe': importe,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PedidoResponse].
  factory PedidoResponse.fromJson(String data) {
    return PedidoResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PedidoResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
