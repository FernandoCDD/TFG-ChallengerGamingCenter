package com.salesianostriana.dam.challengerapi.config;

import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import lombok.extern.java.Log;
import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.*;
import java.util.Optional;
import java.util.UUID;

@Log
public class AuditorAwareImpl implements AuditorAware<String> {

    @Override
    public Optional<String> getCurrentAuditor() {
        return Optional.ofNullable(SecurityContextHolder.getContext())
                .map(SecurityContext::getAuthentication)
                .filter(Authentication::isAuthenticated)
                .map(Authentication::getPrincipal)
                .map(Usuario.class::cast)
                .map(Usuario::getId)
                .map(UUID::toString);


    }



}