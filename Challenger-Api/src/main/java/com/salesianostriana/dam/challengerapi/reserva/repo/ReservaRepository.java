package com.salesianostriana.dam.challengerapi.reserva.repo;

import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface ReservaRepository extends JpaRepository<Reserva, UUID> {

}