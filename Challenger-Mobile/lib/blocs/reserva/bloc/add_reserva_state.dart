part of 'add_reserva_bloc.dart';

@immutable
sealed class AddReservaState {}

final class AddReservaInitial extends AddReservaState {}

final class AddReservaLoading extends AddReservaState {}

final class AddReservaSuccess extends AddReservaState {
  final ReservaResponse reservaResponse;

  AddReservaSuccess(this.reservaResponse);
}

final class AddReservaError extends AddReservaState {
  final String errorMessage;
  AddReservaError(this.errorMessage);
}
