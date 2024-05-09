import 'dart:convert';

class Torneos {
  String? id;
  String? juego;
  String? imagenUrl;
  String? fecha;
  List<dynamic>? participantes;

  Torneos({
    this.id,
    this.juego,
    this.imagenUrl,
    this.fecha,
    this.participantes,
  });

  factory Torneos.fromMap(Map<String, dynamic> data) => Torneos(
        id: data['id'] as String?,
        juego: data['juego'] as String?,
        imagenUrl: data['imagen_url'] as String?,
        fecha: data['fecha'] as String?,
        participantes: data['participantes'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'juego': juego,
        'imagen_url': imagenUrl,
        'fecha': fecha,
        'participantes': participantes,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Torneos].
  factory Torneos.fromJson(String data) {
    return Torneos.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Torneos] to a JSON string.
  String toJson() => json.encode(toMap());
}
