import { Component, TemplateRef, ViewChild } from '@angular/core';
import { Categorias } from '../../models/categoria_list.interface';
import { CategoriaService } from '../../services/categoria.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddCategoriaDto } from '../../models/add_categoria_dto';

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
  selectedFile: File | null = null;

  error = false;
  mensajeError = '';

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

  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }

  addCategoria() { 
    if(this.nombreCategoria === "") {
      this.mensajeError = 'El nombre de la categoría no puede estar vacío';
      this.error = true;
      return;
    }
    
    const nuevaCategoria: AddCategoriaDto = {
      nombreCategoria: this.nombreCategoria,
      imagenUrl: this.selectedFile ? this.selectedFile.name : "",
    };

    const formData: FormData = new FormData();
    formData.append('nuevaCategoria', new Blob([JSON.stringify(nuevaCategoria)], { type: 'application/json' }));
    if (this.selectedFile) {
      formData.append('file', this.selectedFile);
    }
    
    if (nuevaCategoria.imagenUrl && nuevaCategoria.nombreCategoria !== "") {
      this.categoriaService.addCategoria(formData).subscribe(resp =>{
          this.cerrarModal();
          this.cargarPagina();
        }
      );
    }
    window.location.href = "http://localhost:4200/admin/categorias";
  }
}
 