import { Component, OnInit } from '@angular/core';
import { AdminService } from '../../services/admin.service';
import { UsersService } from '../../services/users.service';
import { UserListResponse, Usuarios } from '../../models/user_list.interface';

@Component({
  selector: 'app-users-list-page',
  templateUrl: './users-list-page.component.html',
  styleUrl: './users-list-page.component.css'
})
export class UsersListPageComponent implements OnInit{

  usuariosList: Usuarios[] = [];
  numPagina = 0;
  totalUsuarios = 0;
  usuariosPorPagina = 0;

  constructor(private userService: UsersService) { }

  ngOnInit(): void {
    this.cargarPagina();
  };
  

  cargarPagina(): void{
    this.userService.getUsers(this.numPagina - 1).subscribe(resp =>{ 
      this.usuariosList = resp.content;
      this.totalUsuarios = resp.totalElements;
      this.usuariosPorPagina = resp.pageable.pageSize;
     });
  }
}
