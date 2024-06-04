package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;

import java.util.UUID;

public record GetProductoAdminDto(

        UUID id,

        String nombre,

        String imagen,

        String descripcion,

        double precio,

        double valoracion,

        boolean enVenta,

        String categoria
) {

    public static GetProductoAdminDto of (Producto p){
        return new GetProductoAdminDto(
                p.getId(),
                p.getNombre(),
                p.getImagen(),
                p.getDescripcion(),
                p.getPrecio(),
                p.getValoracion(),
                p.isEnVenta(),
                p.getCategoria().getNombre()
        );
    }
}

