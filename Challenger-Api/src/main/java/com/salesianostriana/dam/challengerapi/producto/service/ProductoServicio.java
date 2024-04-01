package com.salesianostriana.dam.challengerapi.producto.service;

import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import com.salesianostriana.dam.challengerapi.producto.repo.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductoServicio {

    private final ProductoRepository productoRepository;

    public Page<GetProductoDto> getAllProductos(Pageable pageable){
        return productoRepository.getAllProductos(pageable);
    }

    public Producto getProductoDetails(String idProducto){
        return productoRepository.getProductoDetail(idProducto).orElseThrow(RuntimeException::new);
    }


}
