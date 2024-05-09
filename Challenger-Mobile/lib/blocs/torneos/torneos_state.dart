part of 'torneos_bloc.dart';

@immutable
sealed class TorneosState {}

final class TorneosInitial extends TorneosState {}

final class DoTorneosLoading extends TorneosState {}

final class DoTorneosSuccess extends TorneosState {
  final TorneoListResponse torneos;

  DoTorneosSuccess(this.torneos);
}

final class DoTorneosError extends TorneosState {
  final String errorMessage;

  DoTorneosError(this.errorMessage);
}
