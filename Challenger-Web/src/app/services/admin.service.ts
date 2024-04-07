
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginResponse } from '../models/login.interface';
import { HttpClient } from '@angular/common/http';

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