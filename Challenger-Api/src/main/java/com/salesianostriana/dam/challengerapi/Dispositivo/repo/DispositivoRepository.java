package com.salesianostriana.dam.challengerapi.Dispositivo.repo;

import com.salesianostriana.dam.challengerapi.Dispositivo.dto.GetDispositivoDTO;
import com.salesianostriana.dam.challengerapi.Dispositivo.model.Dispositivo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface DispositivoRepository extends JpaRepository<Dispositivo, UUID> {

    @Query("""
            SELECT d
            FROM Dispositivo d
            """)
    Page<GetDispositivoDTO> getAllOrdenadores(Pageable pageable);

    @Query("""
            SELECT d
            FROM Dispositivo d
            WHERE d.tipoDispositivo = 'ORDENADOR'
            AND d.disponible = true
            """)
    List<Dispositivo> getOrdenadoresDisponibles();

    @Query("""
            SELECT d
            FROM Dispositivo d
            WHERE d.tipoDispositivo = 'PS4'
            AND d.disponible = true
            """)
    List<Dispositivo> getPS4Disponibles();

}