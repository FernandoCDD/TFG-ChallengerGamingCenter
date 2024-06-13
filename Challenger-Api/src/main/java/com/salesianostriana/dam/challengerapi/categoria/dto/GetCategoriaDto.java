package com.salesianostriana.dam.challengerapi.categoria.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;

public record GetCategoriaDto (

        String idCategoria,

        String nombre,

        String imagen,

        int cantProductos
){

    public static GetCategoriaDto of (Categoria categoria, int cantProductos){

        return new GetCategoriaDto(
                categoria.getId().toString(),
                categoria.getNombre(),
                categoria.getImagenUrl(),
                cantProductos
        );
    }
}
