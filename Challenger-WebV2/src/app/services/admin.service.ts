
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { LoginResponse } from '../models/login.interface';
import { ChangePasswordDto } from '../models/change_password_dto';
import { UserListResponse, Usuarios } from '../models/user_list.interface';
import { UserDetailsResponse } from '../models/user-details.interface';


@Injectable({
    providedIn: 'root'
})
export class AdminService {

    constructor(private http: HttpClient) { }

    getLoggedAdmin(): Observable<UserDetailsResponse> {
        return this.http.get<UserDetailsResponse>('http://localhost:8080/me', {
            headers: {
                'Authorization': `Bearer ${localStorage.getItem('token')}`,
            }
        });
    }

    changePassword(oldPassword: string, newPassword: string, verifyPassword: string): Observable<ChangePasswordDto> {
        return this.http.put<ChangePasswordDto>('http://localhost:8080/user/changePassword', {
            oldPassword : oldPassword,
            newPassword : newPassword,
            veriyNewPassword: verifyPassword
        }, {
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${localStorage.getItem('token')}`,
            }
        });
    }

    editarFotoDePerfil(formData: FormData): Observable<any> {
        const headers = new HttpHeaders({
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        });
      
        return this.http.put<any>('http://localhost:8080/user/editAvatar', formData, { headers });
      }

}

