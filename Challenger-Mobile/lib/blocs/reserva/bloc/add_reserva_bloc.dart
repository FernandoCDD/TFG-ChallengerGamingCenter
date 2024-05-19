import 'package:bloc/bloc.dart';
import 'package:challenger_api_front/models/dto/new_reserva_dto.dart';
import 'package:challenger_api_front/models/response/reserva_response.dart';
import 'package:challenger_api_front/repositories/reservas/reservas_repo.dart';
import 'package:meta/meta.dart';

part 'add_reserva_event.dart';
part 'add_reserva_state.dart';

class AddReservaBloc extends Bloc<AddReservaEvent, AddReservaState> {

  final ReservaRepository reservaRepository;

  AddReservaBloc(this.reservaRepository) : super(AddReservaInitial()) {
    on<DoAddReservaEvent>(_addReserva);
  }

  void _addReserva(DoAddReservaEvent event, Emitter<AddReservaState> emit) async {
    emit(AddReservaLoading());

    try {
      final NewReservaDto newReservaDto = NewReservaDto(
        tipoDispositivo: event.tipoDispositivo,
        desde: event.desde,
        hasta: event.hasta, 
      );
      final response = await reservaRepository.addReserva(newReservaDto);
      emit(AddReservaSuccess(response));
      return;
    } on Exception catch (e) {
      emit(AddReservaError(e.toString()));
    }
  }
}
