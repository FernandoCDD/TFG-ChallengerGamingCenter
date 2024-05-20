package com.salesianostriana.dam.challengerapi.torneo.service;

import com.salesianostriana.dam.challengerapi.torneo.dto.GetTorneoDto;
import com.salesianostriana.dam.challengerapi.torneo.model.Torneo;
import com.salesianostriana.dam.challengerapi.torneo.repo.TorneoRepository;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TorneoService {

    private final TorneoRepository torneoRepository;

    private Pageable createPageRequestUsing(int page, int size) {
        return PageRequest.of(page, size);
    }

    @Transactional
    public Page<GetTorneoDto> getAllTorneos (Pageable pageable){
        Page<Torneo> torneos = torneoRepository.findAll(pageable);

        int page = 0;
        int size = 5;

        Pageable pageRequest = createPageRequestUsing(page, size);


        List<GetTorneoDto> list=  torneos.stream().map(
                x->{
                    return GetTorneoDto.builder()
                            .fecha(x.getFecha())
                            .id(x.getId())
                            .juego(x.getJuego())
                            .imagen_url(x.getImagenUrl())
                            .participantes(x.getParticipantes().stream().map(y->y.getId().toString()).collect(Collectors.toSet()))
                            .build();
                }

        ).toList();

        int start = (int) pageRequest.getOffset();
        int end = Math.min((start + pageRequest.getPageSize()), list.size());

        List<GetTorneoDto> listContent = list.subList(start,end);

        return new PageImpl<>(listContent, pageRequest, list.size());

    }
}
