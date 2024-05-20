package com.salesianostriana.dam.challengerapi.usuario.repo;

import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<Usuario, UUID> {
    boolean existsByUsernameIgnoreCase(String username);

    Optional<Usuario> findFirstByUsername(String username);

    @Query("""
            SELECT u
            FROM Usuario u
            WHERE cast(u.id as string) = ?1
            """)
    Optional<Usuario> findUsuarioByIdString(String idUsuario);



}
