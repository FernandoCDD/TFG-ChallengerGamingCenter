import 'package:challenger_api_front/models/response/torneo_list_response/torneo_list_response.dart';

abstract class TorneoRepository {
  Future<TorneoListResponse> getAllTorneos();
}
