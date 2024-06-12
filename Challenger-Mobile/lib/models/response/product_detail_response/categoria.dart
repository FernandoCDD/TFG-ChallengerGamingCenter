import 'dart:convert';

class Categoria {
  String? id;
  String? nombre;

  Categoria({this.id, this.nombre});

  factory Categoria.fromMap(Map<String, dynamic> data) => Categoria(
        id: data['id'] as String?,
        nombre: data['nombre'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'nombre': nombre,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Categoria].
  factory Categoria.fromJson(String data) {
    return Categoria.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Categoria] to a JSON string.
  String toJson() => json.encode(toMap());
}
