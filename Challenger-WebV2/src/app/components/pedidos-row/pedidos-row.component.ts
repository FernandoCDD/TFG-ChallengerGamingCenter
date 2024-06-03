import { Component, Input } from '@angular/core';
import { Pedidos } from '../../models/pedidos-list.interface';
import { PedidosService } from '../../services/pedidos.service';

@Component({
  selector: 'app-pedidos-row',
  templateUrl: './pedidos-row.component.html',
  styleUrl: './pedidos-row.component.css'
})
export class PedidosRowComponent {

  @Input() pedido: Pedidos | undefined;

}
