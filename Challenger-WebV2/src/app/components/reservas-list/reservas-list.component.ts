import { Component, Input } from '@angular/core';
import { Reservas } from '../../models/reserva_list.interface';

@Component({
  selector: 'app-reservas-list',
  templateUrl: './reservas-list.component.html',
  styleUrl: './reservas-list.component.css'
})
export class ReservasListComponent {

  @Input() reservasList: Reservas[] = [];
}
