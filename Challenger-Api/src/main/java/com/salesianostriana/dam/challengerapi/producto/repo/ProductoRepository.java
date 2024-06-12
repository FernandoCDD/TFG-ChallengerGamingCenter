package com.salesianostriana.dam.challengerapi.producto.repo;

import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDetailsDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ProductoRepository extends JpaRepository<Producto, UUID> {

    @Query("""
            SELECT p
            FROM Producto p
            WHERE cast(p.id as string)=?1
            """)
    Optional<Producto> getProductoDetail(String idProducto);

    @Query("""
            SELECT p
            FROM Producto p
            WHERE p.categoria.id = ?1
            """)
    List<Producto> findByCategoriaId(UUID categoriaId);

    @Query("""
            SELECT p
            FROM Producto p
            WHERE p.categoria.id = ?1
            """)
    Page<GetProductoDto> getAllProductosDeUnaCategoria (UUID idCategoria, Pageable pageable);

}