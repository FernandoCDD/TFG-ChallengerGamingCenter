package com.salesianostriana.dam.challengerapi.pedido.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.salesianostriana.dam.challengerapi.pedido.model.Pedido;

import java.time.LocalDateTime;

public record GetPedidoDto (

        String idPedido,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        LocalDateTime fecha,

        String usuario,

        String estadoPedido,

        double importe


){
    public static GetPedidoDto of (Pedido p){

        return new GetPedidoDto(
                p.getId().toString(),
                p.getFecha(),
                p.getUsuario(),
                p.getEstadoPedido().toString(),
                p.getLineasPedido().stream().mapToDouble(a -> a.getPrecioUnitario() * a.getCantidad()).sum()
        );
    }
}
