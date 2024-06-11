import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CategoriaListResponse } from '../models/categoria_list.interface';
import { Observable } from 'rxjs';
import { AddCategoriaDto } from '../models/add_categoria_dto';
import { CategoriasDesplegableResponse } from '../models/categorias_desplegable_list.interface';

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

  editCategoria(categoriaId:string, formData: FormData): Observable<AddCategoriaDto> {  
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`,
    });

    return this.http.put<AddCategoriaDto>(`http://localhost:8080/categoria/admin/edit/${categoriaId}`, formData, { headers });
      
  }

  addCategoria(formData: FormData): Observable<AddCategoriaDto> {
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`,
    });

    return this.http.post<AddCategoriaDto>(`http://localhost:8080/categoria/admin/add`, formData, { headers });
  }



  deleteCategoria(idCategoria: string) {
    return this.http.delete(`http://localhost:8080/categoria/admin/delete/${idCategoria}`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });
  }

  getAllCategoriasDelDesplegable(): Observable<CategoriasDesplegableResponse[]> {
    return this.http.get<CategoriasDesplegableResponse[]>(`http://localhost:8080/categoria/admin/mostrarCategoriasDesplegable`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`,
      }
    });

  }
}
