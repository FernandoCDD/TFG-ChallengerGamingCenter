import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ProductListResponse } from '../models/product_list.interface';

@Injectable({
  providedIn: 'root'
})
export class ProductosService {

  constructor(private http: HttpClient) { }

  getProductosList(page: number): Observable<ProductListResponse> {
    return this.http.get<ProductListResponse>(`http://localhost:8080/producto/admin/todos?page=${page}`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
  
}
