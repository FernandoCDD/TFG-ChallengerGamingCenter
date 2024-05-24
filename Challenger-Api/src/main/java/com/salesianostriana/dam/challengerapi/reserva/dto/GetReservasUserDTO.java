package com.salesianostriana.dam.challengerapi.reserva.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

@Builder
public record GetReservasUserDTO(

        String idReserva,

        String usuario,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        LocalDateTime desde,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        LocalDateTime hasta,

        String tipoDispositivo
) {

        public static GetReservasUserDTO of (Reserva res){

                return new GetReservasUserDTO(
                        res.getId().toString(),
                        res.getUsuario(),
                        res.getDesde(),
                        res.getHasta(),
                        res.getTipoDispositivo().toString()
                );
        }
}
