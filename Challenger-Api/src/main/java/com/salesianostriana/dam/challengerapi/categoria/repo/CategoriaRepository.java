package com.salesianostriana.dam.challengerapi.categoria.repo;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface CategoriaRepository extends JpaRepository<Categoria, UUID> {

    @Query("SELECT p FROM Producto p WHERE LOWER(p.categoria.nombre) = LOWER(?1)")
    Page<Producto> productosCategoriaIgnoreCase(String nombreCategoria, Pageable pageable);

    @Query("""
            SELECT COUNT(p)
            FROM Producto p
            JOIN p.categoria as cat
            WHERE cat.id = ?1
            """)
    int contarCantidadProductosDeUnaCategoria (UUID categoriaId);
}