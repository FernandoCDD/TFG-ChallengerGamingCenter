import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../services/authentication.service';
import { Router } from '@angular/router';

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

  constructor(private authService: AuthenticationService, private router: Router) {}

  ngOnInit(): void {
      localStorage.clear();

      let token = localStorage.getItem('token');

      if (token != null) {
        this.router.navigateByUrl('/login')
      }
  }

  login() {
    this.authService.login(this.username, this.password).subscribe(resp => {
      localStorage.setItem('account_id', resp.id)
      localStorage.setItem('token', resp.token)
      this.rol = resp.roles;
      this.id = resp.id;

      console.log(this.id);
      console.log(this.rol);

      if (this.rol.includes('ADMIN')) {
        this.router.navigateByUrl('me')
      } else {
        this.router.navigateByUrl('/client-user')
      }
    })
  }

}
