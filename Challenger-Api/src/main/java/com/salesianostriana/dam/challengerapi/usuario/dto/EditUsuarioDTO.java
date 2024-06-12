package com.salesianostriana.dam.challengerapi.usuario.dto;

import com.salesianostriana.dam.challengerapi.usuario.model.TipoUsuario;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;

public record EditUsuarioDTO(

        @NotNull
        int horasDisponibles

) {

    public static EditUsuarioDTO of (Usuario user){

        return new EditUsuarioDTO(
                user.getHorasDisponibles()
        );
    }
}
