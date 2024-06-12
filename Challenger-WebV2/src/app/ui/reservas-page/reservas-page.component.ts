import { Component, OnInit } from '@angular/core';
import { Reservas } from '../../models/reserva_list.interface';
import { ReservaService } from '../../services/reserva.service';

@Component({
  selector: 'app-reservas-page',
  templateUrl: './reservas-page.component.html',
  styleUrl: './reservas-page.component.css'
})
export class ReservasPageComponent implements OnInit{

  reservasList: Reservas[] = [];
  numPaginas = 0;
  totalReservas = 0;
  reservasPorPagina = 0;

  constructor(private reservasService: ReservaService) { }

  ngOnInit(): void {
    this.cargarPagina();
  }

  cargarPagina(): void{
    this.reservasService.getAllReservas(this.numPaginas - 1).subscribe(resp =>{ 
      this.reservasList = resp.content;
      this.totalReservas = resp.totalElements;
      this.reservasPorPagina = resp.pageable.pageSize;
     });
  }
}
