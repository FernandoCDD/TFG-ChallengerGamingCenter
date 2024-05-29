import { Component, TemplateRef, ViewChild } from '@angular/core';
import { Productos } from '../../models/product_list.interface';
import { ProductosService } from '../../services/productos.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddProductoDto } from '../../models/add_producto_dto';

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
  
  nombreProducto = "";
  imagen = "";
  descripcion = "";
  precio = 0;
  enVenta = false;
  categoria = "";

  @ViewChild('addModal') addModalRef: TemplateRef<any> | undefined;

  constructor(private productoService: ProductosService, private modalService: NgbModal) { }

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

  abrirModal(producto: Productos): void {
    this.modalService.open(this.addModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(){
    this.modalService.dismissAll();
  }
  
  // onSubmit(): void {
  //   const nuevoProducto: AddProductoDto = {
  //     nombre: this.nombreProducto,
  //     imagen: this.imagen,
  //     descripcion: this.descripcion,
  //     precio: this.precio,
  //     enVenta: this.enVenta,
  //     idCategoria: this.idCategoria
  //   };

  //   this.productoService.addProducto(nuevoProducto).subscribe(() => {
  //     this.cargarPagina();
  //     this.cerrarModal();
  //   }, error => {
  //     console.error("Error al añadir producto:", error);
  //   });
  // }
}
