package com.salesianostriana.dam.challengerapi.usuario.dto;

import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;

public record GetUserDto(String username, int horasDisponibles) {

    public static GetUserDto of(Usuario u){
        return new GetUserDto(
                u.getUsername(),
                u.getHorasDisponibles()

        );
    }
}
