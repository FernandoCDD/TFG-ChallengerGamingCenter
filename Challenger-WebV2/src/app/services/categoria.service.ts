import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CategoriaListResponse } from '../models/categoria_list.interface';
import { Observable } from 'rxjs';
import { AddCategoriaDto } from '../models/add_categoria_dto';

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  constructor(private http: HttpClient) { }

  getCategorias(page: number): Observable<CategoriaListResponse> {
    return this.http.get<CategoriaListResponse>(`http://localhost:8080/categoria/?page=${page}`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
  
  editCategoria(categoriaId: string, nombreCategoria: string): Observable<AddCategoriaDto> {
    return this.http.put<AddCategoriaDto>(`http://localhost:8080/categoria/admin/edit/${categoriaId}`, {
      nombreCategoria: nombreCategoria,
    }, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }

  addCategoria(nombreCategoria: string, imagenUrl: string): Observable<AddCategoriaDto> {
    return this.http.post<AddCategoriaDto>(`http://localhost:8080/categoria/admin/add`, {
      nombreCategoria: nombreCategoria,
      imagenUrl: imagenUrl
    }, {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }
}
