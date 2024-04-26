package com.salesianostriana.dam.challengerapi.Pedido.repo;

import com.salesianostriana.dam.challengerapi.Pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.Pedido.model.LineaPedido;
import com.salesianostriana.dam.challengerapi.Pedido.model.Pedido;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface PedidoRepository extends JpaRepository<Pedido, UUID> {

    @Query("""
            select new com.salesianostriana.dam.challengerapi.Pedido.dto.GetPedidoDto(
            cast(p.id as string),
            p.fecha,
             (select u.username from Usuario u where cast(u.id as string) = p.usuario),
             cast(p.estadoPedido as string),
             (select sum(l.precioUnitario * l.cantidad) from LineaPedido l where l.pedido.id = p.id)
            )
            from Pedido p
            """)
    Page<GetPedidoDto> getAllPedidosConClientes(Pageable pageable);

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