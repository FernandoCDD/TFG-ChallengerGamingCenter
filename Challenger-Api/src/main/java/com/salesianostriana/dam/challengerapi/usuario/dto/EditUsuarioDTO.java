package com.salesianostriana.dam.challengerapi.usuario.dto;

import com.salesianostriana.dam.challengerapi.usuario.model.TipoUsuario;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;

public record EditUsuarioDTO(

        int horasDisponibles

) {

    public static EditUsuarioDTO of (Usuario user){

        return new EditUsuarioDTO(
                user.getHorasDisponibles()
        );
    }
}
