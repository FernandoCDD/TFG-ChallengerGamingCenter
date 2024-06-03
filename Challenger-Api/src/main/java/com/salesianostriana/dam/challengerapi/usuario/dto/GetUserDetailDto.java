package com.salesianostriana.dam.challengerapi.usuario.dto;

import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;

import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;

public record GetUserDetailDto(String idUsuario, String username, String email, String avatar,
                               int horasDisponibles, LocalDate createdAt, String rol, boolean activo) {

    public static GetUserDetailDto of(Usuario u){
        return new GetUserDetailDto(
                u.getId().toString(),
                u.getUsername(),
                u.getEmail(),
                u.getAvatar(),
                u.getHorasDisponibles(),
                u.getCreatedAt(),
                u.getRoles().stream().findFirst().map(Enum::toString).orElseThrow(() -> new RuntimeException()),
                u.isEnabled()
        );
    }
}
