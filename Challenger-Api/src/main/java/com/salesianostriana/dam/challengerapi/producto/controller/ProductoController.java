package com.salesianostriana.dam.challengerapi.producto.controller;

import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.service.ProductoServicio;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/producto")
@RequiredArgsConstructor
public class ProductoController {

    private final ProductoServicio productoServicio;

    @GetMapping("/todos")
    public Page<GetProductoDto> getAllProductos(@PageableDefault(page=0, size = 6)Pageable pageable){
        return  productoServicio.getAllProductos(pageable);
    }

    @GetMapping("/detail/{idProducto}")
    public GetProductoDetailsDto getProductoDetailPorId(@PathVariable String idProducto){
        return GetProductoDetailsDto.of(productoServicio.getProductoDetails(idProducto));
    }
}
