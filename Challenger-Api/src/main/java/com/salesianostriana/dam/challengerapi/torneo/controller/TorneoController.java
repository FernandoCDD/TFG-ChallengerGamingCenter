package com.salesianostriana.dam.challengerapi.torneo.controller;

import com.salesianostriana.dam.challengerapi.torneo.dto.GetTorneoDto;
import com.salesianostriana.dam.challengerapi.torneo.service.TorneoService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/torneo")
@RequiredArgsConstructor
public class TorneoController {

    private final TorneoService torneoService;

    @GetMapping("/")
    public Page<GetTorneoDto> getAllTorneos(@PageableDefault(page=0, size = 4) Pageable pageable){
        return torneoService.getAllTorneos(pageable);
    }
}
