import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../services/authentication.service';
import { Router } from '@angular/router';
import { state } from '@angular/animations';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent implements OnInit {

  username = '';
  password = '';
  rol: string[] = [];
  id = '';

  error = false;
  mensajeError = '';

  constructor(private authService: AuthenticationService, private router: Router) {}

  ngOnInit(): void {
      localStorage.clear();

      let token = localStorage.getItem('token');

      if (token != null) {
        this.router.navigateByUrl('/login')
      }
  }

  login() {
    this.authService.login(this.username, this.password).subscribe(
      resp => {
        localStorage.setItem('account_id', resp.id);
        localStorage.setItem('token', resp.token);
        this.rol = resp.roles;
        this.id = resp.id;

        if (this.rol.includes('ADMIN')) {
          this.router.navigateByUrl('admin/me');
        } else {
          this.mensajeError = 'Debes ser administrador para continuar';
          this.error = true;
        }
      },
      err => { 
        if (err.status === 401) {
          this.mensajeError = 'Nombre de usuario o contraseña incorrectos';
        } else {
          this.mensajeError = 'Error al intentar iniciar sesión. Inténtelo de nuevo más tarde.';
        }
        this.error = true;
      }
    );
  }

}
