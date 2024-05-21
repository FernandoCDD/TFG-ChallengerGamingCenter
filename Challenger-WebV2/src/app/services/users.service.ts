import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { UserListResponse } from '../models/user_list.interface';


@Injectable({
  providedIn: 'root'
})

export class UsersService {

  constructor(private http: HttpClient) { }

  getUsers(): Observable<UserListResponse>{
    return this.http.get<UserListResponse>('http://localhost:8080/admin/users', {
            headers: {
                'Authorization': `Bearer  + ${localStorage.getItem('token')}`,
            }
        });
  }
}