
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { LoginResponse } from '../models/login.interface';

@Injectable({
    providedIn: 'root'
})
export class AdminService {
    
    constructor(private http: HttpClient) { }

    getLoggedAdmin(): Observable<LoginResponse> {
        return this.http.get<LoginResponse>('http://localhost:8080/me', {
            headers: {
                'Authorization': `Bearer  + ${localStorage.getItem('token')}`,
            }
        });
    }
}