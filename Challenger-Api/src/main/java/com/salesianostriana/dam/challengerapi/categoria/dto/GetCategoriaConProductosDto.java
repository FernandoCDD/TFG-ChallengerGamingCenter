package com.salesianostriana.dam.challengerapi.categoria.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;

import java.util.List;

public record GetCategoriaConProductosDto (

        String idCategoria,

        String nombre,

        List<GetProductoDto> productos
){}
