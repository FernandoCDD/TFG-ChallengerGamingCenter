package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.salesianostriana.dam.challengerapi.Dispositivo.model.TipoDispositivo;

import java.time.LocalDateTime;

public record NewReservaDTO(

        TipoDispositivo tipoDispositivo,

        LocalDateTime desde,

        LocalDateTime hasta
) {
}
