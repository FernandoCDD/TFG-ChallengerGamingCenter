package com.salesianostriana.dam.challengerapi.usuario.controller;

import com.salesianostriana.dam.challengerapi.security.jwt.access.JwtProvider;
import com.salesianostriana.dam.challengerapi.usuario.dto.*;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final AuthenticationManager authManager;
    private final JwtProvider jwtProvider;


    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Registrarme como Cliente", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = UserResponse.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a84001-8c15-1042-818c-15828332000f",
                                                "username": "luismai",
                                                "avatar": "https://img.a.transfermarkt.technology/portrait/big/610461-1647594517.jpg?lm=1",
                                                "fullName": "Luis Miguel",
                                                "roles": [
                                                    "CLIENTE"
                                                ],
                                                "createdAt": null
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Dato introducido inválido", content = @Content)
    })
    @Operation(summary = "createUser", description = "Registrarme como Cliente")
    @PostMapping("/auth/register")
    public ResponseEntity<UserResponse> register (@RequestBody CreateUserDto createUserDto) {
        Usuario user = userService.createUserWithUserRole(createUserDto);

        return ResponseEntity.status(HttpStatus.CREATED).body(UserResponse.fromUser(user));
    }


    @PostMapping("/auth/login")
    public ResponseEntity<JwtUserResponse> login(@RequestBody LoginRequest loginRequest) {

        Authentication authentication =
                authManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                loginRequest.getUsername(),
                                loginRequest.getPassword()
                        )
                );

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String token = jwtProvider.generateToken(authentication);

        Usuario user = (Usuario) authentication.getPrincipal();

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(JwtUserResponse.of(user, token));

    }

    @PutMapping("/user/changePassword")
    public ResponseEntity<GetUserDetailDto> changePassword(@RequestBody ChangePasswordRequest changePasswordRequest,
                                                       @AuthenticationPrincipal Usuario loggedUser) {

        try {
            if (userService.passwordMatch(loggedUser, changePasswordRequest.getOldPassword())) {
                Optional<Usuario> modified = userService.editPassword(loggedUser.getId(), changePasswordRequest.getNewPassword());
                if (modified.isPresent())
                    return ResponseEntity.ok(GetUserDetailDto.of(modified.get()));
            } else {
                throw new RuntimeException();
            }
        } catch (RuntimeException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Password Data Error");
        }

        return null;
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/me")
    public GetUserDetailDto getLoggedUser(@AuthenticationPrincipal Usuario user) {
        return GetUserDetailDto.of(user);
    }

    @GetMapping("/admin/users") //Funciona
    public Page<GetUserDetailDto> getAllUsers(@PageableDefault(page=0, size = 4) Pageable pageable){

        return userService.getAllUsuarios(pageable);
    }

    @PutMapping("admin/editHoras/{userID}") //Funciona
    public GetUserDetailDto editarHorasDelUsuario (@PathVariable UUID userID, @Valid @RequestBody EditUsuarioDTO editUser){

        Usuario user = userService.editUsuario(editUser, userID);

        return GetUserDetailDto.of(user);
    }

}
