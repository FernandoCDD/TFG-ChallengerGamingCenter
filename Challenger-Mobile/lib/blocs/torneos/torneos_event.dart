part of 'torneos_bloc.dart';

@immutable
sealed class TorneosEvent {}

class GetTorneosEvent extends TorneosEvent {
  GetTorneosEvent();
}
