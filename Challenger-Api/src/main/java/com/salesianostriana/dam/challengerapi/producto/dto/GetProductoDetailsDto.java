package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;

import java.util.UUID;

public record GetProductoDetailsDto(

        UUID id,

        String nombre,

        String imagen,

        String descripcion,

        double precio,

        double valoracion,

        Categoria categoria
) {

    public static GetProductoDetailsDto of (Producto p){
        return new GetProductoDetailsDto(
                p.getId(),
                p.getNombre(),
                p.getImagen(),
                p.getDescripcion(),
                p.getPrecio(),
                p.getValoracion(),
                p.getCategoria()
        );
    }
}


