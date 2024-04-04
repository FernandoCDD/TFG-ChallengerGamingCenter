
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { LoginResponse } from '../models/login.interface';
import { ChangePasswordDto } from '../models/change_password_dto';


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

    changePassword(oldPassword: string, newPassword: string, verifyPassword: string): Observable<ChangePasswordDto> {
        return this.http.put<ChangePasswordDto>('http://localhost:8080/me/password', {
            oldPassword : oldPassword,
            newPassword : newPassword,
            veriyNewPassword: verifyPassword
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer  + ${localStorage.getItem('token')}`,
            }
        });
    }

}