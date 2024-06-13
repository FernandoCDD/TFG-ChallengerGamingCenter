package com.salesianostriana.dam.challengerapi.usuario.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.hibernate.validator.constraints.URL;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record CreateUserDto(

        @NotBlank
        String username,

        @Email
        @NotBlank
        String email,

        String avatar,

        @Size(min = 5, max = 14)
        String password,

        @Size(min = 5, max = 14)
        String verifyPassword,

        @CreatedDate
        LocalDate createdAts
) {
}
