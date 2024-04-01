package com.salesianostriana.dam.challengerapi.usuario.dto;

import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;

import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;

public record GetUserDetailDto(String username, String email, String avatar,
                               int horasDisponibles, LocalDate createdAt) {

    public static GetUserDetailDto of(Usuario u){
        return new GetUserDetailDto(
                u.getUsername(),
                u.getEmail(),
                u.getAvatar(),
                u.getHorasDisponibles(),
                u.getCreatedAt()
        );
    }
}
