package com.salesianostriana.dam.challengerapi.usuario.exception;

import jakarta.persistence.EntityNotFoundException;

public class UserNotFoundException extends EntityNotFoundException {

    public UserNotFoundException(){
        super("The client could not be found");
    }
    public UserNotFoundException(String id){
        super(String.format("The client with the id %s could not be found", id));
    }
}
