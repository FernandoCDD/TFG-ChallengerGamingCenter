import { Component, Input } from '@angular/core';
import { Categorias } from '../../models/categoria_list.interface';

@Component({
  selector: 'app-categoria-list',
  templateUrl: './categoria-list.component.html',
  styleUrl: './categoria-list.component.css'
})
export class CategoriaListComponent {

  @Input() categoriasList: Categorias[] = [];
}
