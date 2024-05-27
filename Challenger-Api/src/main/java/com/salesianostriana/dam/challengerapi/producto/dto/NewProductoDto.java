package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;

import java.util.UUID;

public record NewProductoDto(

        UUID id,

        String nombre,

        String imagen,

        String descripcion,

        double precio,

        UUID idCategoria
) {

    public static NewProductoDto of (Producto p){
        return new NewProductoDto(
                p.getId(),
                p.getNombre(),
                p.getImagen(),
                p.getDescripcion(),
                p.getPrecio(),
                p.getCategoria().getId()
        );
    }
}

