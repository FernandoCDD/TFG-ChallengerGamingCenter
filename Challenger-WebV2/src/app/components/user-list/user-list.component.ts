import { Component, Input } from '@angular/core';
import { Usuarios } from '../../models/user_list.interface';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrl: './user-list.component.css'
})
export class UserListComponent {

  @Input() usuariosList: Usuarios[] = [];
}
