import { Component, Input, TemplateRef, ViewChild } from '@angular/core';
import { Categorias } from '../../models/categoria_list.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { CategoriaService } from '../../services/categoria.service';

@Component({
  selector: 'app-categoria-row',
  templateUrl: './categoria-row.component.html',
  styleUrl: './categoria-row.component.css'
})
export class CategoriaRowComponent {

  @Input() categoria: Categorias | undefined;
  NuevoNombreCategoria = "";


  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(private modalService: NgbModal, private categoriaService: CategoriaService) {}

  abrirModal(categoria: Categorias) {
    this.NuevoNombreCategoria = categoria.nombre;
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal() {
    this.modalService.dismissAll();
  }

  guardarCategoria() { 
    if (this.categoria && this.NuevoNombreCategoria != ""){
      this.categoriaService.editCategoria(this.categoria.idCategoria, this.NuevoNombreCategoria).subscribe(
        resp => {
          this.categoria!.nombre = this.NuevoNombreCategoria;
          this.cerrarModal();
        }
      );
    }
  }
}
