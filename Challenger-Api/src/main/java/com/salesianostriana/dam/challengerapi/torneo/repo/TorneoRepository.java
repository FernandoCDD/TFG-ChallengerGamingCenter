package com.salesianostriana.dam.challengerapi.torneo.repo;

import com.salesianostriana.dam.challengerapi.torneo.dto.GetTorneoDto;
import com.salesianostriana.dam.challengerapi.torneo.model.Torneo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface TorneoRepository extends JpaRepository<Torneo, UUID> {


}