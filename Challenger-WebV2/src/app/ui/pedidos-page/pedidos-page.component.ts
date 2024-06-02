import { Component, OnInit } from '@angular/core';
import { Pedidos } from '../../models/pedidos-list.interface';
import { PedidosService } from '../../services/pedidos.service';

@Component({
  selector: 'app-pedidos-page',
  templateUrl: './pedidos-page.component.html',
  styleUrl: './pedidos-page.component.css'
})
export class PedidosPageComponent implements OnInit{

  pedidosList: Pedidos[] = [];
  numPagina = 0;
  totalPedidos = 0;
  pedidosPorPagina = 0;

  constructor(private pedidosService: PedidosService) { }

  ngOnInit(): void {
    this.cargarPagina();
  }

  cargarPagina(): void {
    this.pedidosService.getAllPedidos(this.numPagina - 1).subscribe(resp => {
      this.pedidosList = resp.content;
      this.totalPedidos = resp.totalElements;
      this.pedidosPorPagina = resp.pageable.pageSize;
    });
  }
}
