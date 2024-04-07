
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { LoginResponse } from '../models/login.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {

  constructor(private http: HttpClient) { }

  login(username: string, password: string): Observable<LoginResponse>{
    return this.http.post<LoginResponse>('http://localhost:8080/auth/login',
    {
      username: username,
      password: password
    },
    {
      headers: {
        'Content-Type': 'application/json',        
      }
    }
    )
  }
}
