package com.salesianostriana.dam.challengerapi.producto.exceptions;

import jakarta.persistence.EntityNotFoundException;

import java.util.UUID;

public class ProductoNotFoundException extends EntityNotFoundException {

    public ProductoNotFoundException(){
        super("The product could not be found");
    }
    public ProductoNotFoundException(UUID id){
        super(String.format("The product with the id %s could not be found", id.toString()));
    }
}