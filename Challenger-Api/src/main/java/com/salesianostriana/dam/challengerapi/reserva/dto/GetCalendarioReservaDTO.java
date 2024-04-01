package com.salesianostriana.dam.challengerapi.reserva.dto;

import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record GetCalendarioReservaDTO(

    UUID id,

    String nombreUsuario,

    LocalDateTime desde,

    LocalDateTime hasta,

    Integer OrdenadoresDisponibles,

    Integer PS4Disponibles

){

}
