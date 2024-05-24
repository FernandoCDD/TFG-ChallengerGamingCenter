package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.producto.model.Producto;

import java.util.UUID;

public record  GetProductoDto(

        UUID id,

        String nombre,

        String imagen,

        double precio,

        boolean enVenta,

        String categoria
) {

    public static GetProductoDto of (Producto p){
        return new GetProductoDto(
                p.getId(),
                p.getNombre(),
                p.getImagen(),
                p.getPrecio(),
                p.isEnVenta(),
                p.getCategoria().getNombre()
        );
    }
}


