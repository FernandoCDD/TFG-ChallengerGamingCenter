package com.salesianostriana.dam.challengerapi.Dispositivo.dto;

import com.salesianostriana.dam.challengerapi.Dispositivo.model.Dispositivo;
import com.salesianostriana.dam.challengerapi.Dispositivo.model.TipoDispositivo;

import java.util.UUID;

public record GetDispositivoDTO(

        UUID id,

        int numDispositivo,

        TipoDispositivo tipoDispositivo,

        boolean disponible
) {

    public static GetDispositivoDTO of (Dispositivo o){

        return new GetDispositivoDTO(
                o.getId(),
                o.getNumDispositivo(),
                o.getTipoDispositivo(),
                o.isDisponible()
        );
    }
}
