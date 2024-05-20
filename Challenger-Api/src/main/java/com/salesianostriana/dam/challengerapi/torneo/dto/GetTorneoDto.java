package com.salesianostriana.dam.challengerapi.torneo.dto;

import com.salesianostriana.dam.challengerapi.torneo.model.Torneo;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.UUID;
@Builder
public record GetTorneoDto(

        UUID id,

        String juego,

        String imagen_url,

        LocalDateTime fecha,

        Set<String> participantes
) {

}
