part of 'add_reserva_bloc.dart';

@immutable
sealed class AddReservaEvent {}

class DoAddReservaEvent extends AddReservaEvent {
  String? idReserva;
  String? username;
  String? desde;
  String? hasta;
  String? tipoDispositivo;

  DoAddReservaEvent({
    this.idReserva,
    this.username,
    this.desde,
    this.hasta,
    this.tipoDispositivo,
  });
}
