package com.salesianostriana.dam.challengerapi.pedido.repo;

import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.pedido.model.LineaPedido;
import com.salesianostriana.dam.challengerapi.pedido.model.Pedido;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface PedidoRepository extends JpaRepository<Pedido, UUID> {

    @Query("""
            SELECT new com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto(
            CAST(p.id AS string),
            p.fecha,
             (SELECT u.username FROM Usuario u WHERE CAST(u.id AS string) = p.usuario),
             CAST(p.estadoPedido AS string),
             (SELECT CASE WHEN SUM(l.precioUnitario * l.cantidad) IS NULL THEN 0 ELSE SUM(l.precioUnitario * l.cantidad) END
              FROM LineaPedido l WHERE l.pedido.id = p.id)
            )
            FROM Pedido p
            WHERE p.estadoPedido = 'CONFIRMADO'
            """)
    Page<GetPedidoDto> getAllPedidosConClientes(Pageable pageable);

    @Query("""
            SELECT new com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto(
            CAST(p.id AS string),
            p.fecha,
            p.usuario,
            CAST(p.estadoPedido AS string),
            (SELECT CASE WHEN SUM(l.precioUnitario * l.cantidad) IS NULL THEN 0 ELSE SUM(l.precioUnitario * l.cantidad) END
             FROM LineaPedido l WHERE l.pedido.id = p.id)
            )
            FROM Pedido p
            WHERE p.estadoPedido = 'CONFIRMADO'
            AND p.usuario = ?1
            """)
    Page<GetPedidoDto> getAllPedidosDelUsuario(String idUsuario, Pageable pageable);

    @Query("""
            SELECT p
            FROM Pedido p
            JOIN FETCH p.lineasPedido
            WHERE p.id = ?1
            """)
    Optional<Pedido> getPedidoById(UUID idPedido);

    @Query("""
            SELECT p
            FROM Pedido p
            JOIN FETCH p.lineasPedido
            WHERE p.usuario = ?1
            AND p.estadoPedido = 'PENDIENTE'
            """)
    Optional<Pedido> getCarritoDelUsuario(String idUsuario);

    @Query("""
            SELECT l
            FROM LineaPedido l
            WHERE l.pedido.id = ?1
            AND l.producto.id = ?2
            ORDER BY l.producto.id ASC
            LIMIT 1
            """)
    Optional<LineaPedido> findLineaPedidoByPedidoYProductos(UUID idPedido, UUID idProducto);

}