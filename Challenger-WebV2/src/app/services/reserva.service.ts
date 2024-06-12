import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ReservaResponse } from '../models/reserva_list.interface';

@Injectable({
  providedIn: 'root'
})
export class ReservaService {

  constructor(private http: HttpClient) { }

  getAllReservas(page: number): Observable <ReservaResponse> {
    return this.http.get<ReservaResponse>(`http://localhost:8080/reserva/admin?page=${page}`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
}
