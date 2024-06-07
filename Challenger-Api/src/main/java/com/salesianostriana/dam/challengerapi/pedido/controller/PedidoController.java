package com.salesianostriana.dam.challengerapi.pedido.controller;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.pedido.service.PedidoService;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import java.util.UUID;

@RestController
@RequestMapping("/pedido")
@RequiredArgsConstructor
public class PedidoController {

    private final PedidoService pedidoService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener los detalles de un pedido", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c",
                                                "usuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                "fecha": "28-02-2024 00:00",
                                                "estadoPedido": "CONFIRMADO",
                                                "lineasPedido": [
                                                    {
                                                        "idProducto": "3300c13e-cbd5-4870-8738-71bfceb2ba67",
                                                        "nombreProducto": "Funko-Pop: Pikachu",
                                                        "urlImagen": "pikachu-funko.jpg",
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
            @ApiResponse(responseCode = "404", description = "Pedido no encontrado", content = @Content)
    })
    @Operation(summary = "getPedidoDetails", description = "Obtener los detalles de un pedido.")
    @GetMapping("/{idPedido}") //Funciona
    public GetPedidoDetailsDto getPedidoDetails (@PathVariable UUID idPedido){
        return pedidoService.getPedidoDetailsDto(idPedido);
    }



    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los pedidos", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "idPedido": "5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c",
                                                        "fecha": "28/02/2024 00:00",
                                                        "usuario": "Luismi",
                                                        "estadoPedido": "CONFIRMADO",
                                                        "importe": 19.99
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 10,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "paged": true,
                                                    "unpaged": false
                                                },
                                                "last": true,
                                                "totalPages": 1,
                                                "totalElements": 1,
                                                "first": true,
                                                "size": 10,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "numberOfElements": 1,
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "La lista de pedidos esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllPedidosAdmin", description = "Obtener todos los pedidos.")
    @GetMapping("/admin/")
    public Page<GetPedidoDto> getAllPedidosAdmin(@PageableDefault(page=0, size = 10)Pageable pageable){
        return pedidoService.getAllPedidos(pageable);
    }



    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener carrito", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "5fe3b57c-57b3-487b-8b0d-68e8d0ffb07c",
                                                "usuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                "fecha": "28-02-2024 00:00",
                                                "estadoPedido": "CONFIRMADO",
                                                "lineasPedido": [
                                                    {
                                                        "idProducto": "3300c13e-cbd5-4870-8738-71bfceb2ba67",
                                                        "nombreProducto": "Funko-Pop: Pikachu",
                                                        "urlImagen": "pikachu-funko.jpg",
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
            @ApiResponse(responseCode = "500", description = "Tu carrito está vacío...", content = @Content)
    })
    @Operation(summary = "getCarrito", description = "Obtener el carrito del usuario.")
    @GetMapping("/carrito")
    public GetPedidoDetailsDto getCarrito(@AuthenticationPrincipal Usuario user){ //Funciona
        return pedidoService.getPedidoDetailsDto(pedidoService.getCarritoDelUsuario(user).getId());
    }

    @Operation(summary = "addProductoToCarrito", description = "Agrega un producto al carrito pasándole el " +
            "id del producto.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Agregar un producto al carrito", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class))
                    )}),
            @ApiResponse(responseCode = "400", description = "Bad Request", content = @Content)
    })
    @PostMapping("carrito/addProducto/{idProducto}") //Funciona
    public GetPedidoDetailsDto addProductoToCarrito(@PathVariable String idProducto, @AuthenticationPrincipal Usuario u){
        return pedidoService.getPedidoDetailsDto(pedidoService.addProductoToCarrito(idProducto, u).getId());
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Producto eliminado del carrito", content = @Content),
            @ApiResponse(responseCode = "500", description = "El producto no está en el carrito.", content = @Content)
    })
    @Operation(summary = "deleteCategoria", description = "Eliminar Categoría por UUID")
    @DeleteMapping("/carrito/deleteProducto/{idProducto}")
    public ResponseEntity<?> deleteProductoDelCarrito(@PathVariable String idProducto, @AuthenticationPrincipal Usuario u){

        pedidoService.eliminarProductoDelCarrito(idProducto, u);

        return ResponseEntity.noContent().build();
    }



    @Operation(summary = "guardarPedidoDelCarrito", description = "Guardar pedido del carrito.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Guardar pedido del carrito", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetCategoriaDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "idPedido": "c0a83801-8ff1-1912-818f-f1b1520a0002",
                                                "fecha": "07/06/2024 09:55",
                                                "usuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5105",
                                                "estadoPedido": "CONFIRMADO",
                                                "importe": 14.99
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Tu carrito está vacío...", content = @Content)
    })
    @PostMapping("/guardarPedido")
    public GetPedidoDto guardarPedidoDelCarrito (@AuthenticationPrincipal Usuario user){

        return pedidoService.guardarPedido(user);
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los pedidos", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "idPedido": "c0a83801-8ff1-1912-818f-f1b1520a0002",
                                                        "fecha": "07/06/2024 09:55",
                                                        "usuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5105",
                                                        "estadoPedido": "CONFIRMADO",
                                                        "importe": 14.99
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 20,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "paged": true,
                                                    "unpaged": false
                                                },
                                                "last": true,
                                                "totalPages": 1,
                                                "totalElements": 1,
                                                "first": true,
                                                "size": 20,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "numberOfElements": 1,
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "La lista de pedidos esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllPedidosConfirmadosDelUsuario", description = "Obtener todos los pedidos del usuario logeado.")
    @GetMapping("/pedidosDelUsuario")
    public Page<GetPedidoDto> getAllPedidosConfirmadosDelUsuario(@AuthenticationPrincipal Usuario user,
                                                                 @PageableDefault(page=0, size = 20)Pageable pageable){

        return pedidoService.getAllPedidosConfirmadosDelUsuario(user, pageable);
    }

}
