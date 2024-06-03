import { Component, Input, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { AdminService } from '../../services/admin.service';
import { Usuarios } from '../../models/user_list.interface';
import { UserDetailsResponse } from '../../models/user-details.interface';
import { FileService } from '../../services/file.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-user-profile-page',
  templateUrl: './user-profile-page.component.html',
  styleUrl: './user-profile-page.component.css'
})
export class UserProfilePageComponent implements OnInit{

  usuario: UserDetailsResponse | undefined;

  avatar = '';
  oldPassword = '';
  newPassword = '';
  verifyPassword = '';

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(private adminService: AdminService, 
              private fileService: FileService,
              private modalService: NgbModal
  ) {}

  ngOnInit(): void {
    this.getLoggedUser();
  }

  abrirModal(): void {
    this.modalService.open(this.editModalRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  cerrarModal(){
    this.modalService.dismissAll();
  }

  getLoggedUser() {
    this.adminService.getLoggedAdmin().subscribe(resp => {
      this.usuario = resp;
      this.cargarImagen(this.usuario);
    });
  }

  changePassword() {
      if (this.newPassword === this.verifyPassword) {
        this.adminService.changePassword(this.oldPassword, this.newPassword, this.verifyPassword).subscribe(resp => {
        });
      } else {
        console.log('Passwords do not match');
    }
  }

  editarFotoDePerfil() {
    this.adminService.editarFotoDePerfil().subscribe(resp => {
      this.getLoggedUser();
    });
  }

  cargarImagen(usuario: UserDetailsResponse): void {
    this.fileService.getFile(usuario.avatar).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      usuario.avatar = objectUrl;
      console.log(usuario.avatar);
    });
  }
}

