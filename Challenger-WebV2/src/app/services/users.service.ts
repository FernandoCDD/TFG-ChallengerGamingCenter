import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { UserListResponse } from '../models/user_list.interface';
import { EditHorasDto } from '../models/editHorasDelUsuario_dto';


@Injectable({
  providedIn: 'root'
})

export class UsersService {

  constructor(private http: HttpClient) { }

  getUsers(page: number): Observable<UserListResponse>{
    return this.http.get<UserListResponse>(`http://localhost:8080/admin/users?page=${page}`, {
            headers: {
              'Authorization': `Bearer ${localStorage.getItem('token')}`,
            }
        });
  }

  editarHoras(userId: string, nuevasHoras: number): Observable<EditHorasDto>{
    return this.http.put<EditHorasDto>(`http://localhost:8080/admin/editHoras/${userId}`, {
      horasDisponibles: nuevasHoras
    }, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
  
}