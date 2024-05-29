import { Component, TemplateRef, ViewChild } from '@angular/core';
import { Categorias } from '../../models/categoria_list.interface';
import { CategoriaService } from '../../services/categoria.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-categorias-page',
  templateUrl: './categorias-page.component.html',
  styleUrl: './categorias-page.component.css'
})
export class CategoriasPageComponent {

  categoriasList: Categorias[] = [];
  numPagina = 0;
  totalCategorias = 0;
  productosPorPagina = 0;

  nombreCategoria = "";
  imagenURL = "";

  @ViewChild('addModal') addModalRef!: TemplateRef<any>;

  constructor(private categoriaService: CategoriaService, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.cargarPagina();
  }

  cargarPagina(): void {
    this.categoriaService.getCategorias(this.numPagina - 1).subscribe(resp => {
      this.categoriasList = resp.content;
      this.totalCategorias = resp.totalElements;
      this.productosPorPagina = resp.pageable.pageSize;
    });
  }

  abrirModal(): void {
    this.modalService.open(this.addModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(){
    this.modalService.dismissAll();
  }

  addCategoria(): void {
    this.categoriaService.addCategoria(this.nombreCategoria, this.imagenURL).subscribe(() => {
      this.cerrarModal();
      this.cargarPagina();
    });
  }
}
