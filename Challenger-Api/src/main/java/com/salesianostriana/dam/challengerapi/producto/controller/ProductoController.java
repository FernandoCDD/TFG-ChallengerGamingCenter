package com.salesianostriana.dam.challengerapi.producto.controller;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaConProductosDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.categoria.service.CategoriaService;
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

import java.util.UUID;

@RestController
@RequestMapping("/producto")
@RequiredArgsConstructor
public class ProductoController {

    private final ProductoServicio productoServicio;

    @GetMapping("/todos") //FUNCIONA
    public Page<GetProductoDto> getAllProductos(@PageableDefault(page=0, size = 50)Pageable pageable){
        return  productoServicio.getAllProductos(pageable);
    }

    @GetMapping("/admin/todos") //FUNCIONA
    public Page<GetProductoAdminDto> getAllProductosAdmin(@PageableDefault(page=0, size = 7)Pageable pageable){
        return  productoServicio.getAllProductosAdmin(pageable);
    }

    @GetMapping("/detail/{idProducto}") //FUNCIONA
    public GetProductoDetailsDto getProductoDetailPorId(@PathVariable String idProducto){
        return GetProductoDetailsDto.of(productoServicio.getProductoDetails(idProducto));
    }

    @GetMapping("/todos/{idCategoria}") //FUNCIONA
    public Page<GetProductoDto> getAllProductosDeUnaCategoria(@PathVariable UUID idCategoria,
                                                              @PageableDefault(page=0, size = 50)Pageable pageable){

        return productoServicio.getAllProductosDeUnaCategoria(idCategoria, pageable);

    }

    @PostMapping("/admin/add") // FUNCIONA
    public ResponseEntity<GetProductoDto> addProducto(@Valid @RequestBody NewProductoDto nuevoProducto){

        Producto prod = productoServicio.addProducto(nuevoProducto);

        return ResponseEntity.status(201).body(GetProductoDto.of(prod));

    }

    @PutMapping("/admin/edit/{idProducto}") //FUNCIONA
    public ResponseEntity<GetProductoDto> editProducto(@Valid @RequestBody NewProductoDto productoEditado,
                                              @PathVariable UUID idProducto) {

        Producto prodEditado = productoServicio.editProducto(productoEditado, idProducto);

        return ResponseEntity.status(HttpStatus.CREATED).body(GetProductoDto.of(prodEditado));

    }

}
