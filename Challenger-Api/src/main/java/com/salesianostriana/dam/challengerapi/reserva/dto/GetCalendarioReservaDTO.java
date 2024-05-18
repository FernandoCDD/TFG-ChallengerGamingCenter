package com.salesianostriana.dam.challengerapi.reserva.dto;

import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record GetCalendarioReservaDTO(

    LocalDateTime desde,

    LocalDateTime hasta

){

}
