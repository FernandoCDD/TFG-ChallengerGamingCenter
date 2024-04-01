package com.salesianostriana.dam.challengerapi.Dispositivo.service;

import com.salesianostriana.dam.challengerapi.Dispositivo.dto.GetDispositivoDTO;
import com.salesianostriana.dam.challengerapi.Dispositivo.model.Dispositivo;
import com.salesianostriana.dam.challengerapi.Dispositivo.repo.DispositivoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class DispositivoService {

    private final DispositivoRepository dispositivoRepository;

    public Page<GetDispositivoDTO> getAllOrdenadores (Pageable pageable){
        return dispositivoRepository.getAllOrdenadores(pageable);
    }

    public Dispositivo findById (UUID id){
        return dispositivoRepository.findById(id).orElseThrow(() -> new RuntimeException());
    }


    public List<Dispositivo> getOrdenadoresDisponibles(){
        return dispositivoRepository.getOrdenadoresDisponibles();
    }

    public List<Dispositivo> getPS4Disponibles(){
        return dispositivoRepository.getPS4Disponibles();
    }

    public Dispositivo getRandomOrdenadorDisponible(){

        List<Dispositivo> ordenadoresDisp = getOrdenadoresDisponibles();

        Random random = new Random();
        int index = random.nextInt(ordenadoresDisp.size());

        return ordenadoresDisp.get(index);
    }

    public Dispositivo getRandomPS4Disponible(){

        List<Dispositivo> ps4Disp = getPS4Disponibles();

        Random random = new Random();
        int index = random.nextInt(ps4Disp.size());

        return ps4Disp.get(index);
    }
}
