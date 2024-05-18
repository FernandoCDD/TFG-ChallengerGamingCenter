package com.salesianostriana.dam.challengerapi.reserva.service;

import com.salesianostriana.dam.challengerapi.Dispositivo.model.Dispositivo;
import com.salesianostriana.dam.challengerapi.Dispositivo.service.DispositivoService;
import com.salesianostriana.dam.challengerapi.reserva.dto.GetCalendarioReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.repo.ReservaRepository;
import com.salesianostriana.dam.challengerapi.usuario.exception.UserNotFoundException;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class   ReservaService {

    private final ReservaRepository repository;
    private final UserService userService;
    private final DispositivoService dispositivoService;

    public Reserva addReservaOrdenador (Usuario user, NewReservaDTO nuevaReserva){

        Reserva reserva = new Reserva();

        reserva.setDesde(nuevaReserva.desde());
        reserva.setHasta(nuevaReserva.hasta());
        reserva.setId_usuario(user.getId().toString());

        return repository.save(reserva);
    }

    public Reserva addReservaPS4 (UUID id_cliente, NewReservaDTO nuevaReserva){

        Usuario user = userService.findById(id_cliente).orElseThrow(() -> new UserNotFoundException());

        Dispositivo disp = dispositivoService.getRandomPS4Disponible();

        Reserva reserva = new Reserva();

        reserva.setDesde(nuevaReserva.desde());
        reserva.setHasta(nuevaReserva.hasta());
        reserva.setId_usuario(user.getId().toString());
        reserva.setId_dispositivo(disp.getId().toString());

        return repository.save(reserva);
    }
}
