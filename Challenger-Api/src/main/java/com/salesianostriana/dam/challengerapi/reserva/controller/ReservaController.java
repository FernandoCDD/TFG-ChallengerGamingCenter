package com.salesianostriana.dam.challengerapi.reserva.controller;

import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.service.ReservaService;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reserva")
@RequiredArgsConstructor
public class ReservaController {

    private final ReservaService reservaService;
    private final UserService userService;


    @PostMapping("/nuevaReserva") //FUNCIONA
    public ResponseEntity<GetReservasUserDTO> agregarReserva (@AuthenticationPrincipal Usuario user,
                                                              @Valid @RequestBody NewReservaDTO nuevaReserva) {

        GetReservasUserDTO res = reservaService.addReserva(user, nuevaReserva);

        return ResponseEntity.status(201).body(res);
    }

}
