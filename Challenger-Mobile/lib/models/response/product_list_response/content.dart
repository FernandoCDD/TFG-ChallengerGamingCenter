import 'dart:convert';

class Content {
  String? uuid;
  String? nombre;
  String? imagen;
  double? precio;
  double? valoracion;

  Content({
    this.uuid,
    this.nombre,
    this.imagen,
    this.precio,
    this.valoracion,
  });

  factory Content.fromMap(Map<String, dynamic> data) => Content(
        uuid: data['uuid'] as String?,
        nombre: data['nombre'] as String?,
        imagen: data['imagen'] as String?,
        precio: (data['precio'] as num?)?.toDouble(),
        valoracion: (data['valoracion'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'nombre': nombre,
        'imagen': imagen,
        'precio': precio,
        'valoracion': valoracion,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Content].
  factory Content.fromJson(String data) {
    return Content.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Content] to a JSON string.
  String toJson() => json.encode(toMap());
}
