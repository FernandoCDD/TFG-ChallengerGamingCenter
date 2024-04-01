import { Component } from '@angular/core';
import { AuthenticationService } from '../../services/authentication.service';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent {

  https: any;
  constructor(private authService: AuthenticationService) { }
  token!: string;

  login(username: string, password: string) {
    this.authService.login(username, password).subscribe((data: any) => {
      this.token = data.token;
    });
  }

  
}
