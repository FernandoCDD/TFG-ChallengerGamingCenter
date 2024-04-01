package com.salesianostriana.dam.challengerapi.Pedido.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;
import java.util.List;

public record GetPedidoDetailsDto(

        String id,

        String usuario,

        @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
        String fecha,
        
        String estadoPedido,

        List<GetLineaPedidoDetailsDto> lineasPedido,

        double total

) {}
