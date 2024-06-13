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
export class ProductosRowComponent implements OnInit {

  @Input() producto: Productos | undefined;
  categoriasList: CategoriasDesplegableResponse[] = [];

  nuevoNombre = "";
  nuevaDescripcion = "";
  nuevoPrecio = 0;
  nuevaCategoria = "";
  selectedFile: File | null = null;

  error = false;
  mensajeError = '';

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(
    private productoService: ProductosService,
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

  abrirModal(producto: Productos): void {
    this.nuevoNombre = producto.nombre;
    this.nuevaDescripcion = producto.descripcion;
    this.nuevoPrecio = producto.precio;
    this.nuevaCategoria = producto.categoria;
    
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(): void {
    this.modalService.dismissAll();
  }

  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }

  editProducto(): void {

    if (this.nuevoNombre == '' || this.nuevaDescripcion == '' || this.nuevoPrecio === 0 || !this.nuevaCategoria) {
      this.mensajeError = 'Todos los campos son obligatorios';
      this.error = true;
      return;
    }

    const productoEditado: AddProductoDto = {
      nombre: this.nuevoNombre,
      imagen: this.selectedFile ? this.selectedFile.name : this.producto!.imagen,
      descripcion: this.nuevaDescripcion,
      precio: this.nuevoPrecio,
      enVenta: this.producto!.enVenta,
      idCategoria: this.nuevaCategoria
    };

    const formData: FormData = new FormData();
    formData.append('productoEditado', new Blob([JSON.stringify(productoEditado)], { type: 'application/json' }));
    if (this.selectedFile) {
      formData.append('nuevaFoto', this.selectedFile);
    }

    this.productoService.editProducto(this.producto!.id, formData).subscribe(resp => {
      this.producto!.nombre = productoEditado.nombre;
      this.producto!.imagen = productoEditado.imagen;
      this.producto!.descripcion = productoEditado.descripcion;
      this.producto!.precio = productoEditado.precio;
      this.producto!.enVenta = productoEditado.enVenta;
      this.producto!.categoria = productoEditado.idCategoria;
      this.cerrarModal();
      window.location.href = "http://localhost:4200/admin/productos";
    });

  }
}
