export interface AddProductoDto {
    nombre:      string;
    imagen:      string;
    descripcion: string;
    precio:      number;
    enVenta:     boolean;
    idCategoria: string;
}
