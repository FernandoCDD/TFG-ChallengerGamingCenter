import { Component, Input, TemplateRef, ViewChild } from '@angular/core';
import { Usuarios } from '../../../models/user_list.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { UsersService } from '../../../services/users.service';


@Component({
  selector: 'app-user-row',
  templateUrl: './user-row.component.html',
  styleUrl: './user-row.component.css'
})
export class UserRowComponent {

  @Input() usuario: Usuarios | undefined;
  nuevasHoras = 0;

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(private modalService: NgbModal, private userService: UsersService) {}

  banearUsuario(){
      this.usuario!.activo = !this.usuario!.activo;
  }

  abrirModal(usuario: Usuarios) {
    this.nuevasHoras = usuario.horasDisponibles;
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal() {
    this.modalService.dismissAll();
  }

  guardarHoras() { 
    if (this.usuario && this.nuevasHoras != undefined){
      this.userService.editarHoras(this.usuario.idUsuario, this.nuevasHoras).subscribe(
        resp => {
          this.usuario!.horasDisponibles = this.nuevasHoras;
          this.cerrarModal();
        }
      );
    }
  }
}
