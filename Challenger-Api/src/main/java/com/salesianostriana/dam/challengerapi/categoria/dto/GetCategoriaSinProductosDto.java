package com.salesianostriana.dam.challengerapi.categoria.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;

public record GetCategoriaSinProductosDto(

        String idCategoria,

        String nombre

){

    public static GetCategoriaSinProductosDto of (Categoria categoria){

        return new GetCategoriaSinProductosDto(
                categoria.getId().toString(),
                categoria.getNombre()
        );
    }
}
