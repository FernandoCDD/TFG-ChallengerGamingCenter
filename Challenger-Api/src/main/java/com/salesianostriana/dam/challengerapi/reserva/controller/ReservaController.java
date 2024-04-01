package com.salesianostriana.dam.challengerapi.reserva.controller;

import com.salesianostriana.dam.challengerapi.Dispositivo.service.DispositivoService;
import com.salesianostriana.dam.challengerapi.reserva.dto.GetCalendarioReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.service.ReservaService;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reservas")
@RequiredArgsConstructor
public class ReservaController {

    private final ReservaService reservaService;
    private final UserService userService;
    private final DispositivoService dispositivoService;

    @GetMapping("/{id_usuario}")
    public Page<GetReservasUserDTO> getReservasDeUnCliente(@PageableDefault(page=0, size = 4) Pageable pageable, @PathVariable String id_usuario){
        return reservaService.getAllPedidosDeUnClienteById(id_usuario, pageable);
    }

//    @PostMapping("/addReserva/Ordenador")
//    public ResponseEntity<GetCalendarioReservaDTO> createReservaOrdenador(@AuthenticationPrincipal Usuario user, @RequestBody NewReservaDTO newReservaDTO){
//
//        return ResponseEntity.status(201).body(reservaService.addReservaOrdenador(user.getId(), newReservaDTO));
//    }
//
//    @PostMapping("/addReserva/ps4")
//    public ResponseEntity<GetCalendarioReservaDTO> createReservaPs4(@AuthenticationPrincipal Usuario user, @RequestBody NewReservaDTO newReservaDTO){
//
//        Reserva res = reservaService.addReserva()
//        return ResponseEntity.status(201).body(reservaService.addReserva(user.getId()));
//    }


}
