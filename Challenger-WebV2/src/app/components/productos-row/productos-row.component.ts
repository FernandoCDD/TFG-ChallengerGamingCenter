import { Component, Input, TemplateRef, ViewChild } from '@angular/core';
import { Productos } from '../../models/product_list.interface';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ReservaService } from '../../services/reserva.service';

@Component({
  selector: 'app-productos-row',
  templateUrl: './productos-row.component.html',
  styleUrl: './productos-row.component.css'
})
export class ProductosRowComponent {

  @Input() producto: Productos | undefined;
  nuevoNombre = "";
  nuevaImagen = "";
  nuevaDescripcion = "";
  nuevoPrecio = 0;

  @ViewChild('editModal') editModalRef: TemplateRef<any> | undefined;

  constructor(private ModalService: NgbModal, private reservaService: ReservaService) {}

  retirarProducto(){
    this.producto!.enVenta = !this.producto!.enVenta;
  }

  getEstadoProducto(enVenta: boolean | undefined): string {
    return enVenta ? 'En Venta' : 'Fuera de Stock';
  }

}
