package com.salesianostriana.dam.challengerapi.categoria.dto;

import jakarta.validation.constraints.NotBlank;

public record NewCategoriaDto(

        @NotBlank
        String nombreCategoria,


        String imagenUrl

) {}
