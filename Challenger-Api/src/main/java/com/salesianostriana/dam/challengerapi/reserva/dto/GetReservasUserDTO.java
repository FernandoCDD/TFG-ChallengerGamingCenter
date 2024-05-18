package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.salesianostriana.dam.challengerapi.Dispositivo.model.TipoDispositivo;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record GetReservasUserDTO(

        UUID id,

        String username,

        LocalDateTime desde,

        LocalDateTime hasta,

        TipoDispositivo tipoDispositivo
) {
}
