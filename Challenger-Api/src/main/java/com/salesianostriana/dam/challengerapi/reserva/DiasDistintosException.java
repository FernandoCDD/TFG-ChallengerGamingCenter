package com.salesianostriana.dam.challengerapi.reserva;

public class DiasDistintosException extends RuntimeException{

    public DiasDistintosException(){
        super("Los días no pueden ser distintos.");
    }
}
