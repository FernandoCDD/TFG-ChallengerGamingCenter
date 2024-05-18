package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record GetReservasUserDTO(

        UUID idReserva,

        String username,

        LocalDateTime desde,

        LocalDateTime hasta,

        String tipoDispositivo
) { }
