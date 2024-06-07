package com.salesianostriana.dam.challengerapi.reserva.controller;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.reserva.dto.GetReservasUserDTO;
import com.salesianostriana.dam.challengerapi.reserva.dto.NewReservaDTO;
import com.salesianostriana.dam.challengerapi.reserva.model.Reserva;
import com.salesianostriana.dam.challengerapi.reserva.service.ReservaService;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reserva")
@RequiredArgsConstructor
public class ReservaController {

    private final ReservaService reservaService;
    private final UserService userService;



    @Operation(summary = "agregarReserva", description = "Agregar una nueva reserva.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Agregar una nueva reserva", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetReservasUserDTO.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "idReserva": "c0a83801-8ff2-1cb4-818f-f20eafa60000",
                                                "usuario": "FernandoCD",
                                                "desde": "19/05/2024 21:54",
                                                "hasta": "19/05/2024 22:54",
                                                "activa": true,
                                                "tipoDispositivo": "ORDENADOR"
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Bad request...", content = @Content)
    })
    @PostMapping("/nuevaReserva") //FUNCIONA
    public ResponseEntity<GetReservasUserDTO> agregarReserva (@AuthenticationPrincipal Usuario user,
                                                              @Valid @RequestBody NewReservaDTO nuevaReserva) {

        GetReservasUserDTO res = reservaService.addReserva(user, nuevaReserva);

        return ResponseEntity.status(201).body(res);
    }



    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todas las reservas", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "idReserva": "c0a83801-8ff2-1cb4-818f-f20eafa60000",
                                                        "usuario": "FernandoCD",
                                                        "desde": "19/05/2024 21:54",
                                                        "hasta": "19/05/2024 22:54",
                                                        "activa": true,
                                                        "tipoDispositivo": "ORDENADOR"
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 6,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "unpaged": false,
                                                    "paged": true
                                                },
                                                "totalPages": 1,
                                                "totalElements": 1,
                                                "last": true,
                                                "size": 6,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "numberOfElements": 1,
                                                "first": true,
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "La lista de reservas esta vacía...", content = @Content)
    })
    @Operation(summary = "getAllReservas", description = "Obtener todas las reservas.")
    @GetMapping("/admin") //Funciona
    public Page<GetReservasUserDTO> getAllReservas (@PageableDefault(page=0, size = 6) Pageable pageable){

        return reservaService.getAllReservas(pageable);
    }

}
