package com.salesianostriana.dam.challengerapi.producto.controller;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaConProductosDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.categoria.service.CategoriaService;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoAdminDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.dto.NewProductoDto;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import com.salesianostriana.dam.challengerapi.producto.service.ProductoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequestMapping("/producto")
@RequiredArgsConstructor
public class ProductoController {

    private final ProductoServicio productoServicio;


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los productos", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetProductoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "id": "3300c13e-cbd5-4870-8738-71bfceb2ba67",
                                                        "nombre": "Funko-Pop: Pikachu",
                                                        "imagen": "pikachu-funko.jpg",
                                                        "precio": 19.99,
                                                        "valoracion": 4.2,
                                                        "enVenta": true,
                                                        "categoria": "Funko-Pops"
                                                    },
                                                    {
                                                        "id": "07bf149e-0701-41bd-b73d-977848b06d9e",
                                                        "nombre": "Gaming Mouse Logitech G203",
                                                        "imagen": "ratonLogitech.jpg",
                                                        "precio": 24.99,
                                                        "valoracion": 4.6,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    },
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 50,
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
                                                "totalElements": 8,
                                                "first": true,
                                                "size": 50,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "numberOfElements": 8,
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "La lista de pedidos esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllProductos", description = "Obtener todos los productos.")
    @GetMapping("/todos") //FUNCIONA
    public Page<GetProductoDto> getAllProductos(@PageableDefault(page=0, size = 50)Pageable pageable){
        return  productoServicio.getAllProductos(pageable);
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los productos como administrador.", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetProductoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "id": "3300c13e-cbd5-4870-8738-71bfceb2ba67",
                                                        "nombre": "Funko-Pop: Pikachu",
                                                        "imagen": "pikachu-funko.jpg",
                                                        "descripcion": "Funko-Pop de pikachu",
                                                        "precio": 19.99,
                                                        "valoracion": 4.2,
                                                        "enVenta": true,
                                                        "categoria": "Funko-Pops"
                                                    },
                                                    {
                                                        "id": "07bf149e-0701-41bd-b73d-977848b06d9e",
                                                        "nombre": "Gaming Mouse Logitech G203",
                                                        "imagen": "ratonLogitech.jpg",
                                                        "descripcion": "Logitech G203 LIGHTSYNC Ratón USB Gaming con Iluminación RGB Personalizable, 6 Botones Programables, Captor 8K para Gaming, Seguimiento de hasta 8,000 DPI, Ultra-ligero - Negro",
                                                        "precio": 24.99,
                                                        "valoracion": 4.6,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 6,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "unpaged": false,
                                                    "paged": true
                                                },
                                                "last": false,
                                                "totalElements": 8,
                                                "totalPages": 2,
                                                "first": true,
                                                "numberOfElements": 6,
                                                "size": 6,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "La lista de productos esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllProductosAdmin", description = "Obtener todos los productos como administrador.")
    @GetMapping("/admin/todos") //FUNCIONA
    public Page<GetProductoAdminDto> getAllProductosAdmin(@PageableDefault(page=0, size = 6)Pageable pageable){
        return  productoServicio.getAllProductosAdmin(pageable);
    }



    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener los detalles de un producto", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "3300c13e-cbd5-4870-8738-71bfceb2ba67",
                                                "nombre": "Funko-Pop: Pikachu",
                                                "imagen": "pikachu-funko.jpg",
                                                "descripcion": "Funko-Pop de pikachu",
                                                "precio": 19.99,
                                                "valoracion": 4.2,
                                                "categoria": {
                                                    "id": "6f5fecf2-a032-434b-9d6f-ed18e4f7d4a0",
                                                    "nombre": "Funko-Pops",
                                                    "imagenUrl": "pikachu-funko.jpg"
                                                }
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Producto no encontrado", content = @Content)
    })
    @Operation(summary = "getProductoDetailPorId", description = "Obtener los detalles de un producto.")
    @GetMapping("/detail/{idProducto}") //FUNCIONA
    public GetProductoDetailsDto getProductoDetailPorId(@PathVariable String idProducto){
        return GetProductoDetailsDto.of(productoServicio.getProductoDetails(idProducto));
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los productos de una categoría.", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetProductoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "id": "07bf149e-0701-41bd-b73d-977848b06d9e",
                                                        "nombre": "Gaming Mouse Logitech G203",
                                                        "imagen": "ratonLogitech.jpg",
                                                        "precio": 24.99,
                                                        "valoracion": 4.6,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    },
                                                    {
                                                        "id": "7e5896a0-7a90-4b09-bfe7-6e3de3c20928",
                                                        "nombre": "Teclado Mecánico HyperX Alloy FPS",
                                                        "imagen": "tecladoHyperX.jpg",
                                                        "precio": 79.99,
                                                        "valoracion": 4.8,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    },
                                                    {
                                                        "id": "fc12e11b-2923-47cf-a255-82b6351bea08",
                                                        "nombre": "Auriculares Gaming HyperX Cloud II",
                                                        "imagen": "tecladoHyperX.jpg",
                                                        "precio": 84.99,
                                                        "valoracion": 4.7,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    },
                                                    {
                                                        "id": "b56ee8a7-6c3d-419f-819a-3e3a7e05e5e5",
                                                        "nombre": "Alfombrilla Razer Goliathus Speed",
                                                        "imagen": "alfombrilla-razer-goliathus-speed-cosmic-small-galeria--2.jpg",
                                                        "precio": 33.99,
                                                        "valoracion": 4.5,
                                                        "enVenta": true,
                                                        "categoria": "Periféricos"
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 50,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "unpaged": false,
                                                    "paged": true
                                                },
                                                "last": true,
                                                "totalElements": 4,
                                                "totalPages": 1,
                                                "first": true,
                                                "numberOfElements": 4,
                                                "size": 50,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "La lista de productos esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllProductosDeUnaCategoria", description = "Obtener todos los productos de una categoría.")
    @GetMapping("/todos/{idCategoria}") //FUNCIONA
    public Page<GetProductoDto> getAllProductosDeUnaCategoria(@PathVariable UUID idCategoria,
                                                              @PageableDefault(page=0, size = 50)Pageable pageable){

        return productoServicio.getAllProductosDeUnaCategoria(idCategoria, pageable);

    }


    @Operation(summary = "addProducto", description = "Agrega un producto a base de datos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Agregar un producto", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetProductoDto.class))
                    )}),
            @ApiResponse(responseCode = "400", description = "Bad Request", content = @Content)
    })
    @PostMapping("/admin/add") // FUNCIONA
    public ResponseEntity<GetProductoDto> addProducto(@Valid @RequestPart("nuevoProducto") NewProductoDto nuevoProducto,
                                                      @RequestPart("file")MultipartFile file){

        Producto prod = productoServicio.addProducto(nuevoProducto, file);

        return ResponseEntity.status(201).body(GetProductoDto.of(prod));

    }


    @Operation(summary = "Edita el nombre de una producto existente")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetProductoDto.class)),
                            examples = @ExampleObject(
                                    value = """
                                            [
                                                 {
                                                 "nombre": "Funko de Mario",
                                                 "imagen": "Imagen.jpeg",
                                                 "descripcion": "A ver si este sale",
                                                 "precio": 49.99,
                                                 "enVenta": false,
                                                 "idCategoria": "6f5fecf2-a032-434b-9d6f-ed18e4f7d4a1"
                                                }
                                            ]
                                            """
                            )
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Producto no encontrado...",
                    content = @Content
            )
    })
    @PutMapping("/admin/edit/{idProducto}") //FUNCIONA
    public ResponseEntity<GetProductoDto> editProducto(@Valid @RequestPart("productoEditado") NewProductoDto productoEditado,
                                              @PathVariable UUID idProducto, @RequestPart("nuevaFoto") MultipartFile file) {

        Producto prodEditado = productoServicio.editProducto(productoEditado, idProducto, file);

        return ResponseEntity.status(HttpStatus.CREATED).body(GetProductoDto.of(prodEditado));

    }

}
