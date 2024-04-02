import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/response/torneo_list_response/torneo_list_response.dart';
import 'package:challenger_api_front/repositories/torneos/torneos_repo.dart';
import 'package:meta/meta.dart';

part 'torneos_event.dart';
part 'torneos_state.dart';

class TorneosBloc extends Bloc<TorneosEvent, TorneosState> {
  final TorneoRepository torneoRepository;

  TorneosBloc(this.torneoRepository) : super(TorneosInitial()) {
    on<GetTorneosEvent>(_doGetTorneos);
  }

  void _doGetTorneos(GetTorneosEvent event, Emitter<TorneosState> emit) async {
    emit(DoTorneosLoading());

    try {
      final response = await torneoRepository.getAllTorneos();
      emit(DoTorneosSuccess(response));
    } on Exception catch (e) {
      emit(DoTorneosError(e.toString()));
    }
  }
}
