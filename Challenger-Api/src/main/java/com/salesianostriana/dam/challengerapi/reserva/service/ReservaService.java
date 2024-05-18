package com.salesianostriana.dam.challengerapi.reserva.service;

import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.model.TipoDispositivo;
import com.salesianostriana.dam.challengerapi.reserva.repo.ReservaRepository;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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

        return new GetReservasUserDTO(
                res.getId(),
                user.getUsername(),
                res.getDesde(),
                res.getHasta(),
                res.getTipoDispositivo().toString()
        );
    }

}
