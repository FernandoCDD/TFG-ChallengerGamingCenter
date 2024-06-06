package com.salesianostriana.dam.challengerapi.pedido.service;

import com.salesianostriana.dam.challengerapi.Pedido.exception.CarritoVacioException;
import com.salesianostriana.dam.challengerapi.Pedido.exception.PedidoNotFoundException;
import com.salesianostriana.dam.challengerapi.Pedido.exception.ProductoNoEstaEnCarritoException;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetLineaPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDetailsDto;
import com.salesianostriana.dam.challengerapi.pedido.dto.GetPedidoDto;
import com.salesianostriana.dam.challengerapi.pedido.model.EstadoPedido;
import com.salesianostriana.dam.challengerapi.pedido.model.LineaPedido;
import com.salesianostriana.dam.challengerapi.pedido.model.Pedido;
import com.salesianostriana.dam.challengerapi.pedido.repo.PedidoRepository;
import com.salesianostriana.dam.challengerapi.producto.exceptions.ProductoNotFoundException;
import com.salesianostriana.dam.challengerapi.producto.model.Producto;
import com.salesianostriana.dam.challengerapi.producto.repo.ProductoRepository;
import com.salesianostriana.dam.challengerapi.usuario.exception.UserNotFoundException;
import com.salesianostriana.dam.challengerapi.usuario.model.Usuario;
import com.salesianostriana.dam.challengerapi.usuario.repo.UserRepository;
import com.salesianostriana.dam.challengerapi.usuario.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PedidoService {

    private final PedidoRepository pedidoRepository;
    private final UserService userService;
    private final ProductoRepository productoRepository;


    public Page<GetPedidoDto> getAllPedidos (Pageable pageable){

        return pedidoRepository.getAllPedidosConClientes(pageable);
    }

    public GetPedidoDetailsDto getPedidoDetailsDto(UUID idPedido) {
        Pedido pedido = pedidoRepository.getPedidoById(idPedido).orElseThrow(PedidoNotFoundException::new);
        Usuario usuario = userService.findUsuarioByIdString(pedido.getUsuario());

        return new GetPedidoDetailsDto(
                pedido.getId().toString(),
                usuario.getId().toString(),
                pedido.getFecha().format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")),
                pedido.getEstadoPedido().toString(),
                pedido.getLineasPedido().stream().map(GetLineaPedidoDetailsDto::of).toList(),
                pedido.getLineasPedido().stream().mapToDouble(x -> x.getPrecioUnitario() *
                        x.getCantidad()).sum());

    }

    public Pedido addProductoToCarrito(String idProducto, Usuario u) {
        Optional <Pedido> pedidoPendiente = pedidoRepository.getCarritoDelUsuario(u.getId().toString());

        Producto productoToAdd = productoRepository.getProductoDetail(idProducto)
                .orElseThrow(ProductoNotFoundException::new);

        if(pedidoPendiente.isEmpty()){
            LineaPedido nuevaLineaPedido = LineaPedido.builder()
                    .precioUnitario(productoToAdd.getPrecio())
                    .cantidad(1)
                    .producto(productoToAdd)
                    .build();

            Pedido newPedidoOpen = Pedido.builder()
                    .fecha(LocalDateTime.now())
                    .estadoPedido(EstadoPedido.PENDIENTE)
                    .usuario(u.getId().toString())
                    .build();

            newPedidoOpen.addLineaPedido(nuevaLineaPedido);
            return pedidoRepository.save(newPedidoOpen);
        }

        Optional<LineaPedido> lineaEncontrada = pedidoRepository.findLineaPedidoByPedidoYProductos
                (pedidoPendiente.get().getId(), productoToAdd.getId());

        if (lineaEncontrada.isEmpty()) {
            LineaPedido nuevaLineaPedido = LineaPedido.builder()
                    .precioUnitario(productoToAdd.getPrecio())
                    .cantidad(1)
                    .producto(productoToAdd)
                    .build();
            pedidoPendiente.get().addLineaPedido(nuevaLineaPedido);
        } else {
            lineaEncontrada.get().setCantidad(lineaEncontrada.get().getCantidad() + 1);
            pedidoPendiente.get().removeLineaPedido(lineaEncontrada.get());
            pedidoPendiente.get().addLineaPedido(lineaEncontrada.get());
        }

        return pedidoRepository.save(pedidoPendiente.get());
    }

    public Pedido getCarritoDelUsuario(Usuario user){ //Funciona
        return pedidoRepository.getCarritoDelUsuario(user.getId().toString())
                .orElseThrow(CarritoVacioException::new);
    }

    public Pedido eliminarProductoDelCarrito(String idProducto, Usuario u) {

        Pedido carrito = pedidoRepository.getCarritoDelUsuario(u.getId().toString())
                .orElseThrow(() -> new CarritoVacioException());

        Producto productoEliminado = productoRepository.getProductoDetail(idProducto)
                .orElseThrow(ProductoNotFoundException::new);


        LineaPedido lineaPedido = pedidoRepository.findLineaPedidoByPedidoYProductos(
                carrito.getId(), productoEliminado.getId()).orElseThrow(() -> new ProductoNoEstaEnCarritoException());

        if (lineaPedido.getCantidad() > 1) {
            lineaPedido.setCantidad(lineaPedido.getCantidad() - 1);
            carrito.removeLineaPedido(lineaPedido);
            carrito.addLineaPedido(lineaPedido);
        } else {
            carrito.removeLineaPedido(lineaPedido);
        }

        return pedidoRepository.save(carrito);
    }

    public GetPedidoDto guardarPedido (Usuario u){

        Pedido carritoDelUsuario = getCarritoDelUsuario(u);

        carritoDelUsuario.setEstadoPedido(EstadoPedido.CONFIRMADO);
        carritoDelUsuario.setFecha(LocalDateTime.now());

        pedidoRepository.save(carritoDelUsuario);

        return GetPedidoDto.of(carritoDelUsuario);
    }

    public Page<GetPedidoDto> getAllPedidosConfirmadosDelUsuario(Usuario user, Pageable pageable){

        return pedidoRepository.getAllPedidosDelUsuario(user.getId().toString(), pageable);
    }
}