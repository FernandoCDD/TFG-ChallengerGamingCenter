package com.salesianostriana.dam.challengerapi.producto.model;

import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import java.util.UUID;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Producto {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator",
            parameters = {
                    @Parameter(
                            name = "uuid_gen_strategy_class",
                            value = "org.hibernate.id.uuid.CustomVersionOneStrategy"
                    )
            }
    )
    @Column(columnDefinition = "uuid")
    private UUID id;

    private String nombre;
    private String imagen;
    private String descripcion;
    private double precio;
    private double valoracion;

    @Builder.Default
    private boolean enVenta = true;

    @ManyToOne
    private Categoria categoria;

}