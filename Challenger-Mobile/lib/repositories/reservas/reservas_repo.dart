import 'package:challenger_api_front/models/dto/new_reserva_dto.dart';
import 'package:challenger_api_front/models/response/reserva_response.dart';

abstract class ReservaRepository {
  Future<ReservaResponse> addReserva(NewReservaDto newReservaDto);
}