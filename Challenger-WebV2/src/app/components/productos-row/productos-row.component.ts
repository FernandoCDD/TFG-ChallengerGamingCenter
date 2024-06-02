import { Component, Input, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { Productos } from '../../models/product_list.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CategoriasDesplegableResponse } from '../../models/categorias_desplegable_list.interface';
import { CategoriaService } from '../../services/categoria.service';
import { ProductosService } from '../../services/productos.service';
import { AddProductoDto } from '../../models/add_producto_dto';

@Component({
  selector: 'app-productos-row',
  templateUrl: './productos-row.component.html',
  styleUrl: './productos-row.component.css'
})
export class ProductosRowComponent implements OnInit{

  @Input() producto: Productos | undefined;
  categoriasList: CategoriasDesplegableResponse[] = [];

  nuevoNombre = "";
  nuevaImagen = "";
  nuevaDescripcion = "";
  nuevoPrecio = 0;
  nuevaCategoria = "";

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(
    private productoSevice: ProductosService,
    private modalService: NgbModal,
    private categoriaService: CategoriaService
  ) { }

  ngOnInit(): void {
    this.getCategorias();
  }

  retirarProducto() {
    this.producto!.enVenta = !this.producto!.enVenta;
  }

  getEstadoProducto(enVenta: boolean | undefined): string {
    return enVenta ? 'En Venta' : 'Fuera de Stock';
  }

  getCategorias(): void {
    this.categoriaService.getAllCategoriasDelDesplegable().subscribe(resp => {
      this.categoriasList = resp;
    });
  }

  abrirModal(): void {
    if (this.producto) {
      this.nuevoNombre = this.producto.nombre;
      this.nuevaImagen = this.producto.imagen;
      this.nuevaDescripcion = this.producto.descripcion;
      this.nuevoPrecio = this.producto.precio;
      this.nuevaCategoria = this.producto.categoria;
    }
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(): void {
    this.modalService.dismissAll();
  }

  editProducto(): void {
    const productoEditado: AddProductoDto = {
      nombre: this.nuevoNombre,
      imagen: this.nuevaImagen,
      descripcion: this.nuevaDescripcion,
      precio: this.nuevoPrecio,
      enVenta: this.producto!.enVenta,
      idCategoria: this.nuevaCategoria
    };
    this.productoSevice.editProducto(this.producto!.id, productoEditado).subscribe(resp => {
      this.producto!.nombre = productoEditado.nombre;
      this.producto!.imagen = productoEditado.imagen;
      this.producto!.descripcion = productoEditado.descripcion;
      this.producto!.precio = productoEditado.precio;
      this.producto!.enVenta = productoEditado.enVenta;
      this.producto!.categoria = productoEditado.idCategoria;
      this.cerrarModal();
    });
    window.location.href = "http://localhost:4200/admin/productos";
  }
}




