import { Component, Input } from '@angular/core';
import { Productos } from '../../models/product_list.interface';

@Component({
  selector: 'app-productos-list',
  templateUrl: './productos-list.component.html',
  styleUrl: './productos-list.component.css'
})
export class ProductosListComponent {

  @Input() productosList: Productos[] = [];
}
