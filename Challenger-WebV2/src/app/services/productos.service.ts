import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ProductListResponse } from '../models/product_list.interface';
import { AddProductoDto } from '../models/add_producto_dto';

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
  

  addProducto(formData: FormData): Observable<AddProductoDto> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    });

    return this.http.post<AddProductoDto>('http://localhost:8080/producto/admin/add', formData, { headers });
  }


  editProducto(productoId: string, formData: FormData): Observable<AddProductoDto> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    });

    return this.http.put<AddProductoDto>(`http://localhost:8080/producto/admin/edit/${productoId}`, formData, { headers });
  }
}
