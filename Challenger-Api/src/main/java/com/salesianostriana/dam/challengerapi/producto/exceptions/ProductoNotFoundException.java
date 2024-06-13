package com.salesianostriana.dam.challengerapi.producto.exceptions;

import jakarta.persistence.EntityNotFoundException;

import java.util.UUID;

public class ProductoNotFoundException extends EntityNotFoundException {

    public ProductoNotFoundException(){
        super("El producto no se ha encontrado");
    }

}