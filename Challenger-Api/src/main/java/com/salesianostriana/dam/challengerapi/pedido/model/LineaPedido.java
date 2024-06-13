package com.salesianostriana.dam.challengerapi.pedido.model;

import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import java.util.Objects;
import java.util.UUID;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@IdClass(LineaPedidoPK.class)
public class LineaPedido {

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
    private UUID codLinea;

    @Id
    @ManyToOne
    private Pedido pedido;

    private double precioUnitario;
    private int cantidad;

    @ManyToOne
    private Producto producto;

    public LineaPedidoPK getId(){
        return new LineaPedidoPK(pedido, codLinea);
    }

    public void setId(LineaPedidoPK pk){
        this.pedido = pk.getPedido();
        this.codLinea = pk.getCodLinea();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LineaPedido that = (LineaPedido) o;
        return Objects.equals(codLinea, that.codLinea) && Objects.equals(pedido, that.pedido);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codLinea, pedido);
    }
}