import { HttpClient } from '@angular/common/http';
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

  addProducto(nuevoProducto: AddProductoDto): Observable<AddProductoDto> {
    return this.http.post<AddProductoDto>('http://localhost:8080/producto/admin/add', {
      nombre: nuevoProducto.nombre,
      imagen: nuevoProducto.imagen,
      descripcion: nuevoProducto.descripcion,
      precio: nuevoProducto.precio,
      enVenta: nuevoProducto.enVenta,
      idCategoria: nuevoProducto.idCategoria
    }, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
  
}
