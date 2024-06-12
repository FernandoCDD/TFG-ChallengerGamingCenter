package com.salesianostriana.dam.challengerapi.categoria.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;

public record GetCategoriasDesplegableDto(

    String idCategoria,

    String nombreCategoria

){

    public static GetCategoriasDesplegableDto of (Categoria cat){

        return new GetCategoriasDesplegableDto(
                cat.getId().toString(),
                cat.getNombre()
        );
    }
}
