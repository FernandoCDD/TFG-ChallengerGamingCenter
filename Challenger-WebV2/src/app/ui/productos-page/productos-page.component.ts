import { Component } from '@angular/core';
import { Productos } from '../../models/product_list.interface';
import { ProductosService } from '../../services/productos.service';

@Component({
  selector: 'app-productos-page',
  templateUrl: './productos-page.component.html',
  styleUrl: './productos-page.component.css'
})
export class ProductosPageComponent {

  productosList: Productos[] = [];
  numPagina = 0;
  totalProductos = 0;
  productosPorPagina = 0;

  constructor(private productoService: ProductosService) { }

  ngOnInit(): void {
    this.cargarPagina();
  }

  cargarPagina(): void {
    this.productoService.getProductosList(this.numPagina - 1).subscribe(resp => {
      this.productosList = resp.content;
      this.totalProductos = resp.totalElements;
      this.productosPorPagina = resp.pageable.pageSize;
    });
  }
}
