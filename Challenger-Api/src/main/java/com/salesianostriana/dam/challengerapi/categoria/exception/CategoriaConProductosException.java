package com.salesianostriana.dam.challengerapi.categoria.exception;

public class CategoriaConProductosException extends RuntimeException{

    public CategoriaConProductosException(String nombreCategoria){
        super(nombreCategoria+" no se puede borrar por que tiene productos asociados");
    }
}
