package com.salesianostriana.dam.challengerapi.Dispositivo.controller;

import com.salesianostriana.dam.challengerapi.Dispositivo.dto.GetDispositivoDTO;
import com.salesianostriana.dam.challengerapi.Dispositivo.service.DispositivoService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/dispositivo")
@RequiredArgsConstructor
public class DispositivoController {

    private final DispositivoService dispositivoService;

    @GetMapping("/")
    public Page<GetDispositivoDTO> getAllProductos(@PageableDefault(page=0, size = 6) Pageable pageable){
        return dispositivoService.getAllOrdenadores(pageable);
    }

}
