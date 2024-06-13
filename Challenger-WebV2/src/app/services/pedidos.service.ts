import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { PedidosListResponse } from '../models/pedidos-list.interface';

@Injectable({
  providedIn: 'root'
})
export class PedidosService {

  constructor(private http: HttpClient) { }

  getAllPedidos(page: number) : Observable<PedidosListResponse>{
    return this.http.get<PedidosListResponse>(`http://localhost:8080/pedido/admin/?page=${page}`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }

}
