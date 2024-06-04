package com.salesianostriana.dam.challengerapi.pedido.dto;

import com.salesianostriana.dam.challengerapi.pedido.model.LineaPedido;

public record GetLineaPedidoDetailsDto(

        String idProducto,

        String nombreProducto,

        String urlImagen,

        int cantidad,

        double precioUnitario,

        double subtotal
) {

    public static GetLineaPedidoDetailsDto of (LineaPedido ln){

        return new GetLineaPedidoDetailsDto(
                ln.getProducto().getId().toString(),
                ln.getProducto().getNombre(),
                ln.getProducto().getImagen(),
                ln.getCantidad(),
                ln.getPrecioUnitario(),
                ln.getCantidad() * ln.getPrecioUnitario()
        );
    }
}
