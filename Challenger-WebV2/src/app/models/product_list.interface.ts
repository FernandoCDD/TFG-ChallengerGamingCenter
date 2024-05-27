export interface ProductListResponse {
    content:          Productos[];
    pageable:         Pageable;
    totalElements:    number;
    totalPages:       number;
    last:             boolean;
    size:             number;
    number:           number;
    sort:             Sort;
    numberOfElements: number;
    first:            boolean;
    empty:            boolean;
}

export interface Productos {
    idProducto: string;
    nombre:     string;
    valoracion: number;
    precio:     number;
    enVenta:    boolean;
    categoria:  Categoria;
}

export enum Categoria {
    FunkoPops = "Funko-Pops",
    Periféricos = "Periféricos",
}

export interface Pageable {
    pageNumber: number;
    pageSize:   number;
    sort:       Sort;
    offset:     number;
    paged:      boolean;
    unpaged:    boolean;
}

export interface Sort {
    empty:    boolean;
    sorted:   boolean;
    unsorted: boolean;
}
