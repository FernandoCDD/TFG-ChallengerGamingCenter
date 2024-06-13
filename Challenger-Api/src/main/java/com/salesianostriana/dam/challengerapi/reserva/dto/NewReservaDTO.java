package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.model.TipoDispositivo;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

public record NewReservaDTO(

        @NotNull
        TipoDispositivo tipoDispositivo,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        LocalDateTime desde,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        LocalDateTime hasta
) { }
