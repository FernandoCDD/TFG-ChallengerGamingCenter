package com.salesianostriana.dam.challengerapi.usuario.service;

import com.salesianostriana.dam.challengerapi.usuario.dto.CreateUserDto;
import com.salesianostriana.dam.challengerapi.usuario.exception.UserNotFoundException;
import com.salesianostriana.dam.challengerapi.usuario.model.TipoUsuario;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.repo.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.EnumSet;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public Usuario createUser(CreateUserDto createUserDto, EnumSet<TipoUsuario> roles) {

        if (userRepository.existsByUsernameIgnoreCase(createUserDto.username()))
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "El nombre de usuario ya existe");

        Usuario user =  Usuario.builder()
                .username(createUserDto.username())
                .password(passwordEncoder.encode(createUserDto.password()))
                .email(createUserDto.email())
                .avatar(createUserDto.avatar())
                .roles(roles)
                .createdAt(LocalDate.now())
                .build();

        return userRepository.save(user);
    }

    public Usuario createUserWithUserRole(CreateUserDto createUserDto) {
        return createUser(createUserDto, EnumSet.of(TipoUsuario.CLIENTE));
    }

    public Usuario createUserWithAdminRole(CreateUserDto createUserDto) {
        return createUser(createUserDto, EnumSet.of(TipoUsuario.ADMIN));
    }

    public List<Usuario> findAll() {
        return userRepository.findAll();
    }

    public Optional<Usuario> findById(UUID id) {
        return userRepository.findById(id);
    }

    public Optional<Usuario> findByUsername(String username) {
        return userRepository.findFirstByUsername(username);
    }

    public Usuario findUsuarioByIdString(String idUsuario){
        return userRepository.findUsuarioByIdString(idUsuario).orElseThrow(() -> new UserNotFoundException(idUsuario));
    }

    public Optional<Usuario> edit(Usuario user) {

        return userRepository.findById(user.getId())
                .map(u -> {
                    u.setAvatar(user.getAvatar());
                    return userRepository.save(u);
                }).or(() -> Optional.empty());

    }

    public Optional<Usuario> editPassword(UUID userId, String newPassword) {

        return userRepository.findById(userId)
                .map(u -> {
                    u.setPassword(passwordEncoder.encode(newPassword));
                    return userRepository.save(u);
                });

    }

    public void delete(Usuario user) {
        deleteById(user.getId());
    }

    public void deleteById(UUID id) {
        // Prevenimos errores al intentar borrar algo que no existe
        if (userRepository.existsById(id))
            userRepository.deleteById(id);
    }

    public boolean passwordMatch(Usuario user, String clearPassword) {
        return passwordEncoder.matches(clearPassword, user.getPassword());
    }

}