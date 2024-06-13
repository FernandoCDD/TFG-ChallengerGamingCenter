package com.salesianostriana.dam.challengerapi.categoria.exception;

public class CategoriaNotFoundException extends RuntimeException{

    public CategoriaNotFoundException(String nombreCategoria){
        super("No se ha encontrado la categoría con el id: "+nombreCategoria);
    }
}
