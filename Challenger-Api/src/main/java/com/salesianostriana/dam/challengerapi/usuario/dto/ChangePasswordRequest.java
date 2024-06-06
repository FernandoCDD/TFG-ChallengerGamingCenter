package com.salesianostriana.dam.challengerapi.usuario.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChangePasswordRequest {

    @NotNull
    private String oldPassword;

    @NotNull
    private String newPassword;

    @NotNull
    private String verifyNewPassword;

}

