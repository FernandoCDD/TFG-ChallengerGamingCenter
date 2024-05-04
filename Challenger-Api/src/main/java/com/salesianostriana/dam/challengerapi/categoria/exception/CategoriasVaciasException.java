package com.salesianostriana.dam.challengerapi.categoria.exception;

public class CategoriasVaciasException extends RuntimeException{

    public CategoriasVaciasException(){

        super("La lista de categorías esta vacía.");
    }
}
