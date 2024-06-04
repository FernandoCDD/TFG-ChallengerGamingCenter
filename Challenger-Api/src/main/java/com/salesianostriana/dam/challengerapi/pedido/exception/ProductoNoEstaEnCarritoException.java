package com.salesianostriana.dam.challengerapi.Pedido.exception;

public class ProductoNoEstaEnCarritoException extends RuntimeException{

    public ProductoNoEstaEnCarritoException(){
        super("El producto no está en el carrito.");
    }
}
