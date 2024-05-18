package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.model.TipoDispositivo;

import java.time.LocalDateTime;

public record NewReservaDTO(

        TipoDispositivo tipoDispositivo,

        LocalDateTime desde,

        LocalDateTime hasta
) { }
