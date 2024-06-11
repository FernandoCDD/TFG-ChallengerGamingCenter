import { Component, TemplateRef, ViewChild } from '@angular/core';
import { Productos } from '../../models/product_list.interface';
import { ProductosService } from '../../services/productos.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddProductoDto } from '../../models/add_producto_dto';
import { CategoriaService } from '../../services/categoria.service';
import { CategoriasDesplegableResponse } from '../../models/categorias_desplegable_list.interface';

@Component({
  selector: 'app-productos-page',
  templateUrl: './productos-page.component.html',
  styleUrl: './productos-page.component.css'
})
export class ProductosPageComponent {
  productosList: Productos[] = [];
  categoriasList: CategoriasDesplegableResponse[] = [];
  numPagina = 0;
  totalProductos = 0;
  productosPorPagina = 0;

  nombreProducto = "";
  descripcion = "";
  precio = 0;
  categoria = "";
  selectedFile: File | null = null;

  error = false;
  mensajeError = '';

  @ViewChild('addModalProducto') addModalRef!: TemplateRef<any>;

  constructor(
    private productoService: ProductosService,
    private categoriaService: CategoriaService,
    private modalService: NgbModal
  ) { }

  ngOnInit(): void {
    this.cargarPagina();
    this.getCategorias();
  }

  cargarPagina(): void {
    this.productoService.getProductosList(this.numPagina - 1).subscribe(resp => {
      this.productosList = resp.content;
      this.totalProductos = resp.totalElements;
      this.productosPorPagina = resp.pageable.pageSize;
    });
  }

  getCategorias(): void {
    this.categoriaService.getAllCategoriasDelDesplegable().subscribe(resp => {
      this.categoriasList = resp;
    });
  }

  abrirModal(): void {
    this.modalService.open(this.addModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(): void {
    this.modalService.dismissAll();
  }

  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }

  addProducto(): void {

    if (!this.nombreProducto || !this.descripcion || this.precio === null || !this.categoria) {
      this.mensajeError = 'Todos los campos son obligatorios.';
      this.error = true;
      return;
    }

    const nuevoProducto: AddProductoDto = {
      nombre: this.nombreProducto,
      imagen: this.selectedFile ? this.selectedFile.name : "",
      descripcion: this.descripcion,
      precio: this.precio,
      enVenta: true,
      idCategoria: this.categoria
    };

    const formData: FormData = new FormData();
    formData.append('nuevoProducto', new Blob([JSON.stringify(nuevoProducto)], { type: 'application/json' }));
    if (this.selectedFile) {
      formData.append('file', this.selectedFile);
    }

    this.productoService.addProducto(formData).subscribe(() => {
      this.cerrarModal();
      this.cargarPagina();
    });
  }
}
