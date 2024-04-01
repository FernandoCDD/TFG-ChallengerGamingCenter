package com.salesianostriana.dam.challengerapi.Pedido.controller;

import com.salesianostriana.dam.challengerapi.Pedido.dto.GetPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.Pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.Pedido.service.PedidoService;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping("/pedido")
@RequiredArgsConstructor
public class PedidoController {

    private final PedidoService pedidoService;

    @GetMapping("/{idPedido}") //Funciona
    public GetPedidoDetailsDto getPedidoDetails (@PathVariable UUID idPedido){
        return pedidoService.getPedidoDetailsDto(idPedido);
    }

    @GetMapping("/admin/")
    public Page<GetPedidoDto> getAllPedidos(@PageableDefault(page=0, size = 4)Pageable pageable){
        return pedidoService.getAllPedidos(pageable);
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Añadir producto al carrito", content = {
                    @Content(mediaType = "application/json",
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a84001-8c1a-1778-818c-1a47b92a0011",
                                                "direccion": "c/Evangelista, 3",
                                                "telefono": "334665121",
                                                "estadoPedido": "ABIERTO",
                                                "horaLlegada": "29-11-2023 09:52",
                                                "lineasPedido": [
                                                    {
                                                        "nombreProducto": "Patatas Bravas",
                                                        "cantidadProductos": 2,
                                                        "precioUnit": 2.3,
                                                        "subtotal": 4.6
                                                    },
                                                    {
                                                        "nombreProducto": "Tarta de queso",
                                                        "cantidadProductos": 6,
                                                        "precioUnit": 4.3,
                                                        "subtotal": 25.799999999999997
                                                    },
                                                    {
                                                        "nombreProducto": "Hamburguesa Queso",
                                                        "cantidadProductos": 3,
                                                        "precioUnit": 3.55,
                                                        "subtotal": 10.649999999999999
                                                    }
                                                ],
                                                "total": 41.05
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Producto no encontrado", content = @Content),
    })
    @Operation(summary = "addProductoToCarrito", description = "Añadir producto al carrito")
    @PostMapping("/addProducto/{idProducto}")
    public GetPedidoDetailsDto addProductoToCarrito(@PathVariable String idProducto, @AuthenticationPrincipal Usuario u){
        return pedidoService.getPedidoDetailsDto(pedidoService.addProductoToCarrito(idProducto, u).getId());
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener el pedido pendiente", content = {
                    @Content(mediaType = "application/json",
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a84001-8c1a-1778-818c-1a47b92a0011",
                                                "direccion": "c/Evangelista, 3",
                                                "telefono": "334665121",
                                                "estadoPedido": "ABIERTO",
                                                "horaLlegada": "29-11-2023 09:52",
                                                "lineasPedido": [
                                                    {
                                                        "nombreProducto": "Patatas Bravas",
                                                        "cantidadProductos": 2,
                                                        "precioUnit": 2.3,
                                                        "subtotal": 4.6
                                                    },
                                                    {
                                                        "nombreProducto": "Tarta de queso",
                                                        "cantidadProductos": 6,
                                                        "precioUnit": 4.3,
                                                        "subtotal": 25.799999999999997
                                                    },
                                                    {
                                                        "nombreProducto": "Hamburguesa Queso",
                                                        "cantidadProductos": 3,
                                                        "precioUnit": 3.55,
                                                        "subtotal": 10.649999999999999
                                                    }
                                                ],
                                                "total": 41.05
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Obtener el pedido pendiente", content = @Content),
    })
    @Operation(summary = "getPedidoPendiente", description = "Añadir producto al carrito")

    @GetMapping("/pedido/carrito")
    public GetPedidoDetailsDto getOpenPedido(@AuthenticationPrincipal Usuario user) {
        return pedidoService.getPedidoDetailsDto(pedidoService.getCarritoDelUsuario(user).getId());
    }
}
