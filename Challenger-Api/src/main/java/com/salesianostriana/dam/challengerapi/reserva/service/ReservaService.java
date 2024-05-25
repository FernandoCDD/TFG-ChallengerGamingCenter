package com.salesianostriana.dam.challengerapi.reserva.service;

import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.model.TipoDispositivo;
import com.salesianostriana.dam.challengerapi.reserva.repo.ReservaRepository;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ReservaService {

    private final ReservaRepository reservaRepository;

    public GetReservasUserDTO addReserva (Usuario user, NewReservaDTO nuevaReserva){

        Reserva res = Reserva.builder()
                .usuario(user.getUsername())
                .desde(nuevaReserva.desde())
                .hasta(nuevaReserva.hasta())
                .tipoDispositivo(nuevaReserva.tipoDispositivo())
                .build();

        reservaRepository.save(res);

        return GetReservasUserDTO.of(res);
    }

    public Page<GetReservasUserDTO> getAllReservas (Pageable pageable){

        Page <Reserva> reservasPage = reservaRepository.findAll(pageable);

        List<GetReservasUserDTO> reservasDto = reservasPage.getContent().stream()
                .map( GetReservasUserDTO::of).collect(Collectors.toList());

        return new PageImpl<>(reservasDto, pageable, reservasPage.getTotalElements());

    }
}
