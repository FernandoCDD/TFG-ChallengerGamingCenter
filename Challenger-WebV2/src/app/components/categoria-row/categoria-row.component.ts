import { Component, Input, TemplateRef, ViewChild } from '@angular/core';
import { Categorias } from '../../models/categoria_list.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CategoriaService } from '../../services/categoria.service';
import { AddCategoriaDto } from '../../models/add_categoria_dto';

@Component({
  selector: 'app-categoria-row',
  templateUrl: './categoria-row.component.html',
  styleUrls: ['./categoria-row.component.css']
})
export class CategoriaRowComponent {

  @Input() categoria: Categorias | undefined;
  NuevoNombreCategoria = "";
  mostrarError = false;
  selectedFile: File | null = null;

  error = false;
  mensajeError = '';

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(private modalService: NgbModal, private categoriaService: CategoriaService) {}

  abrirModal(categoria: Categorias) {
    this.NuevoNombreCategoria = categoria.nombre;
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal() {
    this.modalService.dismissAll();
  }

  onFileSelected(event: any): void {
    this.selectedFile = event.target.files[0];
  }

  guardarCategoria() { 

    if(this.NuevoNombreCategoria == "") {
      this.mensajeError = 'El nombre de la categoría no puede estar vacío';
      this.error = true;
      return;
    }

    const nuevaCategoria: AddCategoriaDto = {
      nombreCategoria: this.NuevoNombreCategoria,
      imagenUrl: this.selectedFile ? this.selectedFile.name : "",
    }

    const formData: FormData = new FormData();
    formData.append('categoriaEditada', new Blob([JSON.stringify(nuevaCategoria)], { type: 'application/json' }));
    if (this.selectedFile) {
      formData.append('file', this.selectedFile);
    }
    
    if (nuevaCategoria.imagenUrl && nuevaCategoria.nombreCategoria !== "") {
      this.categoriaService.editCategoria(this.categoria!.idCategoria, formData).subscribe(resp =>{
          this.categoria!.nombre = this.NuevoNombreCategoria;
          this.cerrarModal();
        }
      );
    }
    window.location.href = "http://localhost:4200/admin/categorias";
  }

  eliminarCategoria(idCategoria: string) {
    if (this.categoria?.cantProductos === 0) {
      this.categoriaService.deleteCategoria(idCategoria).subscribe(
        () => window.location.href = "/admin/categorias",
        error => console.error('Error al eliminar la categoría', error)
      );
    } else {
      this.mostrarError = true;
      setTimeout(() => {
        this.mostrarError = false;
      }, 3000);
    }
  }
}
