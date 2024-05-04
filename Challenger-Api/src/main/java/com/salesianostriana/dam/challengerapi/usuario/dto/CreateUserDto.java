package com.salesianostriana.dam.challengerapi.usuario.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record CreateUserDto(

        String username,
        String email,

        String avatar,
        String password,
        String verifyPassword,
        @CreatedDate
        LocalDate createdAts
) {
}
