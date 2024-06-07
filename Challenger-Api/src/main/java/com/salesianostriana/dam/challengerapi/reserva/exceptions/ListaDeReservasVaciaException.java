package com.salesianostriana.dam.challengerapi.reserva.exceptions;

public class ListaDeReservasVaciaException extends RuntimeException{

    public ListaDeReservasVaciaException(){
        super("La lista de reservas está vacía...");
    }
}
