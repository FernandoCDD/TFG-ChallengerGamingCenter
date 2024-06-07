package com.salesianostriana.dam.challengerapi.usuario.controller;

import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.producto.dto.GetProductoDto;
import com.salesianostriana.dam.challengerapi.security.jwt.access.JwtProvider;
import com.salesianostriana.dam.challengerapi.usuario.dto.*;
import com.salesianostriana.dam.challengerapi.usuario.exception.UserNotFoundException;
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
import org.springframework.web.multipart.MultipartFile;
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


    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Loguearme en la aplicación", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = JwtUserResponse.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                "username": "Luismi",
                                                "email": "luismi@gmail.com",
                                                "avatar": "Macho-Man-Randy-Savage.jpg",
                                                "roles": [
                                                    "CLIENTE"
                                                ],
                                                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI5Y2QwYzQzYS02YTcyLTQ5NjctYTYyOS01ZjUxYmZiZTUxMDYiLCJpYXQiOjE3MTc3NTM2MzMsImV4cCI6MTcxNzg0MDAzM30.R64bpdGXcDzieu_NJBR-FK253qmfX5k041g72aL6emHbbXYkCwdh6kquFNNckCJlyg969z4tAu75zjIgcEkGDg"
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "401", description = "Bad credentials", content = @Content)
    })
    @Operation(summary = "createUser", description = "Loguearme en la aplicación")
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


    @Operation(summary = "Edita la contraseña del usuario")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetUserDetailDto.class)),
                            examples = @ExampleObject(
                                    value = """
                                            [
                                                 {
                                                     "oldPassword": "1234",
                                                     "newPassword": "4321",
                                                     "veriyNewPassword": "4321"
                                                 }
                                            ]
                                            """
                            )
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Usuario no encontrado...",
                    content = @Content
            )
    })
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


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener el usuario logeado.", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "idUsuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                "username": "Luismi",
                                                "email": "luismi@gmail.com",
                                                "avatar": "Macho-Man-Randy-Savage.jpg",
                                                "horasDisponibles": 5,
                                                "createdAt": null,
                                                "rol": "CLIENTE",
                                                "activo": true
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Usuario no encontrado", content = @Content)
    })
    @Operation(summary = "getLoggedUser", description = "Obtener el usuario logeado.")
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/me")
    public GetUserDetailDto getLoggedUser(@AuthenticationPrincipal Usuario user) {
        return GetUserDetailDto.of(user);
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener todos los usuarios", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetUserDetailDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "content": [
                                                    {
                                                        "idUsuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5105",
                                                        "username": "FernandoCD",
                                                        "email": "fernandocdd02@gmail.com",
                                                        "avatar": "sheamus.jpg",
                                                        "horasDisponibles": 5,
                                                        "createdAt": null,
                                                        "rol": "ADMIN",
                                                        "activo": true
                                                    },
                                                    {
                                                        "idUsuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5107",
                                                        "username": "Miguel",
                                                        "email": "miguel@gmail.com",
                                                        "avatar": "hulkHogan.png",
                                                        "horasDisponibles": 5,
                                                        "createdAt": null,
                                                        "rol": "CLIENTE",
                                                        "activo": true
                                                    },
                                                    {
                                                        "idUsuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                        "username": "Luismi",
                                                        "email": "luismi@gmail.com",
                                                        "avatar": "Macho-Man-Randy-Savage.jpg",
                                                        "horasDisponibles": 5,
                                                        "createdAt": null,
                                                        "rol": "CLIENTE",
                                                        "activo": true
                                                    }
                                                ],
                                                "pageable": {
                                                    "pageNumber": 0,
                                                    "pageSize": 7,
                                                    "sort": {
                                                        "empty": true,
                                                        "sorted": false,
                                                        "unsorted": true
                                                    },
                                                    "offset": 0,
                                                    "unpaged": false,
                                                    "paged": true
                                                },
                                                "totalPages": 1,
                                                "totalElements": 3,
                                                "last": true,
                                                "size": 7,
                                                "number": 0,
                                                "sort": {
                                                    "empty": true,
                                                    "sorted": false,
                                                    "unsorted": true
                                                },
                                                "numberOfElements": 3,
                                                "first": true,
                                                "empty": false
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "No hay usuarios...", content = @Content)
    })
    @Operation(summary = "getAllUsers", description = "Obtener todos los usuarios.")
    @GetMapping("/admin/users") //Funciona
    public Page<GetUserDetailDto> getAllUsers(@PageableDefault(page=0, size = 7) Pageable pageable){

        return userService.getAllUsuarios(pageable);
    }


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener el usuario por ID.", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetPedidoDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "idUsuario": "9cd0c43a-6a72-4967-a629-5f51bfbe5106",
                                                "username": "Luismi",
                                                "email": "luismi@gmail.com",
                                                "avatar": "Macho-Man-Randy-Savage.jpg",
                                                "horasDisponibles": 5,
                                                "createdAt": null,
                                                "rol": "CLIENTE",
                                                "activo": true
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Usuario no encontrado", content = @Content)
    })
    @Operation(summary = "getUserDetail", description = "Obtener el usuario por ID.")
    @GetMapping("admin/user/{userID}")
    public GetUserDetailDto getUserDetail (@PathVariable UUID userID){

        return userService.getUsuarioDetails(userID);
    }


    @Operation(summary = "Edita la contreseña del usuario logueado.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetUserDetailDto.class)),
                            examples = @ExampleObject(
                                    value = """
                                            [
                                                 {
                                                     "horasDisponibles": 4
                                                 }
                                            ]
                                            """
                            )
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Usuario no encontrado...",
                    content = @Content
            )
    })
    @PutMapping("admin/editHoras/{userID}") //Funciona
    public GetUserDetailDto editarHorasDelUsuario (@PathVariable UUID userID, @Valid @RequestBody EditUsuarioDTO editUser){

        Usuario user = userService.editHorasDelUsuario(editUser, userID);

        return GetUserDetailDto.of(user);
    }


    @Operation(summary = "Edita el avatar del usuario logeado.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetUserDetailDto.class))
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Usuario no encontrado...",
                    content = @Content
            )
    })
    @PreAuthorize("isAuthenticated()")
    @PutMapping("/user/editAvatar")
    public GetUserDetailDto editarAvatarDelUsuario (@AuthenticationPrincipal Usuario user,
                                                    @RequestPart("nuevaFoto")MultipartFile file){

       Usuario usuario = userService.editAvatar(user, file).orElseThrow(UserNotFoundException::new);

       return GetUserDetailDto.of(usuario);
    }
}
