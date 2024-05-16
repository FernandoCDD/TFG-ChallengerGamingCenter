import 'dart:convert';

class LineasPedido {
  String? id;
  String? nombreProducto;
  String? urlImagen;
  int? cantidad;
  double? precioUnitario;
  double? subtotal;

  LineasPedido({
    this.id,
    this.nombreProducto,
    this.urlImagen,
    this.cantidad,
    this.precioUnitario,
    this.subtotal,
  });

  factory LineasPedido.fromMap(Map<String, dynamic> data) => LineasPedido(
        id: data['id'] as String?,
        nombreProducto: data['nombreProducto'] as String?,
        urlImagen: data['urlImagen'] as String?,
        cantidad: data['cantidad'] as int?,
        precioUnitario: (data['precioUnitario'] as num?)?.toDouble(),
        subtotal: (data['subtotal'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nombreProducto': nombreProducto,
        'urlImagen': urlImagen,
        'cantidad': cantidad,
        'precioUnitario': precioUnitario,
        'subtotal': subtotal,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LineasPedido].
  factory LineasPedido.fromJson(String data) {
    return LineasPedido.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LineasPedido] to a JSON string.
  String toJson() => json.encode(toMap());
}
