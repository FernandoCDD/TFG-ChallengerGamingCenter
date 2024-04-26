package com.salesianostriana.dam.challengerapi.producto.service;

import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import com.salesianostriana.dam.challengerapi.producto.repo.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

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

    public Page<GetProductoDto> getAllProductosDeUnaCategoria(UUID idCategoria, Pageable pageable){

        return productoRepository.getAllProductosDeUnaCategoria(idCategoria, pageable);
    }

    public Producto addProducto (GetProductoDetailsDto nuevoProducto){

        Producto prod = new Producto();

        prod.setNombre(nuevoProducto.nombre());
        prod.setImagen(nuevoProducto.imagen());
        prod.setDescripcion(nuevoProducto.descripcion());
        prod.setPrecio(nuevoProducto.precio());
        prod.setValoracion(nuevoProducto.valoracion());
        prod.setCategoria(nuevoProducto.categoria());

        return productoRepository.save(prod);
    }
}
