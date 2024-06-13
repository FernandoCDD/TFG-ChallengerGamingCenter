import { Component, Input } from '@angular/core';
import { Pedidos } from '../../models/pedidos-list.interface';

@Component({
  selector: 'app-pedidos-list',
  templateUrl: './pedidos-list.component.html',
  styleUrl: './pedidos-list.component.css'
})
export class PedidosListComponent {

  @Input() pedidosList: Pedidos[] = [];
}
