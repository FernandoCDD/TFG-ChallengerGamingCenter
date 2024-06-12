export interface CategoriaListResponse {
    content:          Categorias[];
    pageable:         Pageable;
    last:             boolean;
    totalElements:    number;
    totalPages:       number;
    first:            boolean;
    size:             number;
    number:           number;
    sort:             Sort;
    numberOfElements: number;
    empty:            boolean;
}

export interface Categorias {
    idCategoria:   string;
    nombre:        string;
    cantProductos: number;
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
