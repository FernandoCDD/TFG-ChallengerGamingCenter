import 'dart:convert';

import 'categoria.dart';

class ProductDetailResponse {
  String? id;
  String? nombre;
  String? imagen;
  String? descripcion;
  double? precio;
  double? valoracion;
  Categoria? categoria;

  ProductDetailResponse({
    this.id,
    this.nombre,
    this.imagen,
    this.descripcion,
    this.precio,
    this.valoracion,
    this.categoria,
  });

  factory ProductDetailResponse.fromMap(Map<String, dynamic> data) {
    return ProductDetailResponse(
      id: data['id'] as String?,
      nombre: data['nombre'] as String?,
      imagen: data['imagen'] as String?,
      descripcion: data['descripcion'] as String?,
      precio: (data['precio'] as num?)?.toDouble(),
      valoracion: (data['valoracion'] as num?)?.toDouble(),
      categoria: data['categoria'] == null
          ? null
          : Categoria.fromMap(data['categoria'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'nombre': nombre,
        'imagen': imagen,
        'descripcion': descripcion,
        'precio': precio,
        'valoracion': valoracion,
        'categoria': categoria?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductDetailResponse].
  factory ProductDetailResponse.fromJson(String data) {
    return ProductDetailResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductDetailResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
