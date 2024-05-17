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
import org.springframework.http.ResponseEntity;
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

    @GetMapping("/carrito")
    public GetPedidoDetailsDto getCarrito(@AuthenticationPrincipal Usuario user){ //Funciona
        return pedidoService.getPedidoDetailsDto(pedidoService.getCarritoDelUsuario(user).getId());
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Añadir producto al carrito", content = {
                    @Content(mediaType = "application/json",
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                 "id": "c0a83801-8f19-1bbd-818f-192ece060000",
                                                 "usuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5105",
                                                 "fecha": "26-04-2024 08:54",
                                                 "estadoPedido": "PENDIENTE",
                                                 "lineasPedido": [
                                                     {
                                                         "nombreProducto": "Funko-Pop: Pikachu",
                                                         "cantidad": 1,
                                                         "precioUnitario": 19.99,
                                                         "subtotal": 19.99
                                                     }
                                                 ],
                                                 "total": 19.99
                                             }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Producto no encontrado", content = @Content),
    })
    @Operation(summary = "addProductoToCarrito", description = "Añadir producto al carrito")
    @PostMapping("carrito/addProducto/{idProducto}") //Funciona
    public GetPedidoDetailsDto addProductoToCarrito(@PathVariable String idProducto, @AuthenticationPrincipal Usuario u){
        return pedidoService.getPedidoDetailsDto(pedidoService.addProductoToCarrito(idProducto, u).getId());
    }

    @DeleteMapping("/carrito/deleteProducto/{idProducto}")
    public ResponseEntity<?> deleteProductoDelCarrito(@PathVariable String idProducto, @AuthenticationPrincipal Usuario u){

        pedidoService.eliminarProductoDelCarrito(idProducto, u);

        return ResponseEntity.noContent().build();
    }

}
