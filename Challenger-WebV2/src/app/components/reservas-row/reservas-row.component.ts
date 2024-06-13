import { Component, Input } from '@angular/core';
import { Reservas } from '../../models/reserva_list.interface';
import { ReservaService } from '../../services/reserva.service';

@Component({
  selector: 'app-reservas-row',
  templateUrl: './reservas-row.component.html',
  styleUrl: './reservas-row.component.css'
})
export class ReservasRowComponent {

  @Input() reserva: Reservas | undefined;

  constructor(private reservasService: ReservaService) {}

  cancelarReserva() {
    this.reserva!.activa = !this.reserva!.activa;
  } 

  getEstadoReserva(activa: boolean | undefined): string {
    return activa ? 'Activa' : 'Anulada';
  }
}
