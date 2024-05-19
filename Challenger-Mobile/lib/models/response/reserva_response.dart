import 'dart:convert';

class ReservaResponse {
  String? idReserva;
  String? username;
  String? desde;
  String? hasta;
  String? tipoDispositivo;

  ReservaResponse({
    this.idReserva,
    this.username,
    this.desde,
    this.hasta,
    this.tipoDispositivo,
  });

  factory ReservaResponse.fromMap(Map<String, dynamic> data) {
    return ReservaResponse(
      idReserva: data['idReserva'] as String?,
      username: data['username'] as String?,
      desde: data['desde'] as String?,
      hasta: data['hasta'] as String?,
      tipoDispositivo: data['tipoDispositivo'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'idReserva': idReserva,
        'username': username,
        'desde': desde,
        'hasta': hasta,
        'tipoDispositivo': tipoDispositivo,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ReservaResponse].
  factory ReservaResponse.fromJson(String data) {
    return ReservaResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ReservaResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}
