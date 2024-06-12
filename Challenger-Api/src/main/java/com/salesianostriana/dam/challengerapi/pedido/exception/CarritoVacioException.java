package com.salesianostriana.dam.challengerapi.Pedido.exception;

public class CarritoVacioException extends RuntimeException{

    public CarritoVacioException() {
        super("Tu carrito está vacío...");
    }

}
