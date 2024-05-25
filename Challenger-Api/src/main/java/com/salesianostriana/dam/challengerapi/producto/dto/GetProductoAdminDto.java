package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.producto.model.Producto;

import java.util.UUID;

public record GetProductoAdminDto(

        UUID idProducto,

        String nombre,

        double valoracion,

        double precio,

        String categoria
) {

    public static GetProductoAdminDto of (Producto prod){

        return new GetProductoAdminDto(
                prod.getId(),
                prod.getNombre(),
                prod.getValoracion(),
                prod.getPrecio(),
                prod.getCategoria().getNombre()
        );
    }
}
