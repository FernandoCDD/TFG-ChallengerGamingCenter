package com.salesianostriana.dam.challengerapi.Pedido.dto;

import com.salesianostriana.dam.challengerapi.Pedido.model.LineaPedido;

public record GetLineaPedidoDetailsDto(

        String nombreProducto,

        String urlImagen,

        int cantidad,

        double precioUnitario,

        double subtotal
) {

    public static GetLineaPedidoDetailsDto of (LineaPedido ln){

        return new GetLineaPedidoDetailsDto(
                ln.getProducto().getNombre(),
                ln.getProducto().getImagen(),
                ln.getCantidad(),
                ln.getPrecioUnitario(),
                ln.getCantidad() * ln.getPrecioUnitario()
        );
    }
}
