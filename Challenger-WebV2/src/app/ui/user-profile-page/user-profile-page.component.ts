import { Component, Input, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { AdminService } from '../../services/admin.service';
import { Usuarios } from '../../models/user_list.interface';
import { UserDetailsResponse } from '../../models/user-details.interface';
import { FileService } from '../../services/file.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-user-profile-page',
  templateUrl: './user-profile-page.component.html',
  styleUrl: './user-profile-page.component.css'
})
export class UserProfilePageComponent implements OnInit{

  usuario: UserDetailsResponse | undefined;

  avatar: File | null = null;
  errorFoto = false;
  mensajeErrorFoto = '';
  oldPassword = '';
  newPassword = '';
  verifyPassword = '';

  error = false;
  mensajeErrorPassword = '';  

  @ViewChild('editModalFoto') editModalRef: TemplateRef<any> | undefined;
  @ViewChild('editModalPassword') editModalPasswordRef: TemplateRef<any> | undefined;

  constructor(private adminService: AdminService, 
              private fileService: FileService,
              private modalService: NgbModal
  ) {}

  ngOnInit(): void {
    this.getLoggedUser();
  }

  abrirModalPassword(): void {
    this.modalService.open(this.editModalPasswordRef, { ariaLabelledBy: 'modal-basic-title' });
  }

  abrirModalFoto(): void {
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
    this.error = false;
    this.mensajeErrorPassword = '';
  
    if (this.oldPassword == '') {
      this.mensajeErrorPassword = 'La contraseña actual es obligatoria.';
      this.error = true;
    } else if (this.newPassword == '') {
      this.mensajeErrorPassword = 'La nueva contraseña es obligatoria.';
      this.error = true;
    } else if (this.verifyPassword == '') {
      this.mensajeErrorPassword = 'La verificación de la nueva contraseña es obligatoria.';
      this.error = true;
    } else if (this.newPassword != this.verifyPassword) {
      this.mensajeErrorPassword = 'Las nuevas contraseñas no coinciden';
      this.error = true;
    }

    if (!this.error) {
      this.adminService.changePassword(this.oldPassword, this.newPassword, this.verifyPassword).subscribe(resp => {
        this.mensajeErrorPassword = '';
        window.location.href = "http://localhost:4200/login";}
      )}else{
        this.error = true;
      }
  }

  onFileSelected(event: any): void {
    this.avatar = event.target.files[0];
  }

  cambiarFotoDePerfil(): void {
    if (!this.avatar) {
      this.errorFoto = true;
      this.mensajeErrorFoto = 'Debe seleccionar una imagen.';
      return;
    }
  
    const formData = new FormData();
    formData.append('nuevaFoto', this.avatar, this.avatar.name);
  
    this.adminService.editarFotoDePerfil(formData).subscribe({
      next: () => {
        this.cerrarModal();
        this.getLoggedUser();
      },
      error: (error) => {
        this.errorFoto = true;
        this.mensajeErrorFoto = 'Ocurrió un error al cambiar la foto de perfil. Por favor, inténtelo de nuevo.';
        console.error(error);
      }
    });
  }

  cargarImagen(usuario: UserDetailsResponse): void {
    this.fileService.getFile(usuario.avatar).subscribe((blob: Blob) => {
      const objectUrl = URL.createObjectURL(blob);
      usuario.avatar = objectUrl;
    });
  }
}

