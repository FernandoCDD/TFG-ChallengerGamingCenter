package com.salesianostriana.dam.challengerapi.categoria.service;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaConProductosDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.NewCategoriaDto;
import com.salesianostriana.dam.challengerapi.categoria.exception.CategoriaConProductosException;
import com.salesianostriana.dam.challengerapi.categoria.exception.CategoriaNotFoundException;
import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.categoria.repo.CategoriaRepository;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
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

@Service
@RequiredArgsConstructor
public class CategoriaService {

    private final CategoriaRepository categoriaRepository;
    private final ProductoRepository productoRepository;


    public Page<GetCategoriaDto> getCategoriasConCantidadProductos(Pageable pageable){

        List<Categoria> categorias = categoriaRepository.findAll();
        List<GetCategoriaDto> categoriasDto = new ArrayList<>();

        for(Categoria categoria: categorias){
            categoriasDto.add(GetCategoriaDto.of(categoria, categoriaRepository.contarCantidadProductosDeUnaCategoria(categoria.getId())));
        }

        int start = (int)pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), categoriasDto.size());
        final Page<GetCategoriaDto> categoriasPageada = new PageImpl<>(categoriasDto.subList(start, end), pageable, categoriasDto.size());

        return categoriasPageada;

    }

    public Categoria createCategoria (NewCategoriaDto nuevaCategoria){

        Categoria cat = new Categoria();

        cat.setNombre(nuevaCategoria.nombreCategoria());

        return categoriaRepository.save(cat);
    }

    public Categoria editCategoria (NewCategoriaDto editCategoria, UUID idCategoria) {

        Categoria cat = categoriaRepository.findById(idCategoria)
                .orElseThrow(() -> new CategoriaNotFoundException(idCategoria.toString()));

        cat.setNombre(editCategoria.nombreCategoria());

        return categoriaRepository.save(cat);

    }

    public void deleteCategoria (UUID idCategoria) {

        Categoria cat = categoriaRepository.findById(idCategoria).
                orElseThrow(() -> new CategoriaNotFoundException(idCategoria.toString()));

        int cantProductos = categoriaRepository.contarCantidadProductosDeUnaCategoria(idCategoria);

        if (cantProductos == 0)
            categoriaRepository.delete(cat);
        else
            throw new CategoriaConProductosException(idCategoria.toString());
    }
}
