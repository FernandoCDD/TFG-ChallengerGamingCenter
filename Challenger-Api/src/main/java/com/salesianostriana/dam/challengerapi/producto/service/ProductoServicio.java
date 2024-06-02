package com.salesianostriana.dam.challengerapi.producto.service;

import com.salesianostriana.dam.challengerapi.categoria.exception.CategoriaNotFoundException;
import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.categoria.repo.CategoriaRepository;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoAdminDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.dto.NewProductoDto;
import com.salesianostriana.dam.challengerapi.producto.exceptions.ProductoNotFoundException;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import com.salesianostriana.dam.challengerapi.producto.repo.ProductoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductoServicio {

    private final ProductoRepository productoRepository;
    private final CategoriaRepository categoriaRepository;

    public Page<GetProductoDto> getAllProductos(Pageable pageable){

        Page<Producto> productosPage = productoRepository.findAll(pageable);

        List<GetProductoDto> productosDto = productosPage.getContent().stream()
                .map(GetProductoDto::of).collect(Collectors.toList());

        return new PageImpl<>(productosDto, pageable, productosPage.getTotalElements());

    }

    public Page<GetProductoAdminDto> getAllProductosAdmin (Pageable pageable){

        Page<Producto> productosPage = productoRepository.findAll(pageable);

        List<GetProductoAdminDto> productosDto = productosPage.getContent().stream()
                .map(GetProductoAdminDto::of).collect(Collectors.toList());

        return new PageImpl<>(productosDto, pageable, productosPage.getTotalElements());
    }

    public Producto getProductoDetails(String idProducto){
        return productoRepository.getProductoDetail(idProducto).orElseThrow(RuntimeException::new);
    }

    public Page<GetProductoDto> getAllProductosDeUnaCategoria(UUID idCategoria, Pageable pageable){

        return productoRepository.getAllProductosDeUnaCategoria(idCategoria, pageable);
    }

    public Producto addProducto (NewProductoDto nuevoProducto){

        Producto prod = new Producto();
        Categoria catEscogida = categoriaRepository.findById(nuevoProducto.idCategoria())
                .orElseThrow(() -> new CategoriaNotFoundException(nuevoProducto.idCategoria().toString()));

        prod.setNombre(nuevoProducto.nombre());
        prod.setImagen(nuevoProducto.imagen());
        prod.setDescripcion(nuevoProducto.descripcion());
        prod.setPrecio(nuevoProducto.precio());
        prod.setCategoria(catEscogida);

        return productoRepository.save(prod);
    }

    public Producto editProducto (NewProductoDto productoEditado, UUID idProducto){

        Producto prodAEditar = productoRepository.findById(idProducto)
                .orElseThrow(() -> new ProductoNotFoundException());

        Categoria catEscogida = categoriaRepository.findById(productoEditado.idCategoria())
                .orElseThrow(() -> new CategoriaNotFoundException(productoEditado.idCategoria().toString()));

        prodAEditar.setNombre(productoEditado.nombre());
        prodAEditar.setImagen(productoEditado.imagen());
        prodAEditar.setDescripcion(productoEditado.descripcion());
        prodAEditar.setPrecio(productoEditado.precio());
        prodAEditar.setEnVenta(productoEditado.enVenta());
        prodAEditar.setCategoria(catEscogida);

        return productoRepository.save(prodAEditar);
    }
}
