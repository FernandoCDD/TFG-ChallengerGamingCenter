package com.salesianostriana.dam.challengerapi.producto.dto;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.util.UUID;

public record NewProductoDto(

        UUID id,

        @NotBlank
        String nombre,

        String imagen,

        @NotBlank
        String descripcion,

        @NotNull
        double precio,

        boolean enVenta,

        UUID idCategoria
) {

    public static NewProductoDto of (Producto p){
        return new NewProductoDto(
                p.getId(),
                p.getNombre(),
                p.getImagen(),
                p.getDescripcion(),
                p.getPrecio(),
                p.isEnVenta(),
                p.getCategoria().getId()
        );
    }
}

