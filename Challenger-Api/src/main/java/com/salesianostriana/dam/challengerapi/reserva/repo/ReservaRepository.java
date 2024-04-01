package com.salesianostriana.dam.challengerapi.reserva.repo;

import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface ReservaRepository extends JpaRepository<Reserva, UUID> {

    @Query("""
            SELECT r
            FROM Reserva r
            WHERE r.id_usuario = ?1
            """)
    Page<Reserva> getReservasDelCliente(String id_usuario, Pageable pageable);



}