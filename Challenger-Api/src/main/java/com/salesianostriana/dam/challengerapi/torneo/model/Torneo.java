package com.salesianostriana.dam.challengerapi.torneo.model;

import com.salesianostriana.dam.challengerapi.Pedido.model.LineaPedidoPK;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Torneo {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator",
            parameters = {
                    @org.hibernate.annotations.Parameter(
                            name = "uuid_gen_strategy_class",
                            value = "org.hibernate.id.uuid.CustomVersionOneStrategy"
                    )
            }
    )
    @Column(columnDefinition = "uuid")
    private UUID id;

    private String juego;

    private String imagenUrl;

    private LocalDateTime fecha;

    @Builder.Default
    @OneToMany(mappedBy = "torneoActual", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Usuario> participantes = new HashSet<>();

    public void addParticipante(Usuario usuario){
        participantes.add(usuario);
        usuario.setTorneoActual(this);
    }

    public void removeParticipante(Usuario usuario){
        participantes.remove(usuario);
        usuario.setTorneoActual(null);
    }

}
