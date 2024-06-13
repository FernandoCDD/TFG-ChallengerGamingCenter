class NewReservaDto{
  String? tipoDispositivo;
  String? desde;
  String? hasta;

  NewReservaDto({this.tipoDispositivo, this.desde, this.hasta});

  NewReservaDto.fromJson(Map<String, dynamic> json) {
    tipoDispositivo = json['tipoDispositivo'];
    desde = json['desde'];
    hasta = json['hasta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tipoDispositivo'] = tipoDispositivo;
    data['desde'] = desde;
    data['hasta'] = hasta;
    return data;
  }

}