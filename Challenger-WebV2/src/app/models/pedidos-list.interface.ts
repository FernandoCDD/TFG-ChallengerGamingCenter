export interface PedidosListResponse {
    content:          Pedidos[];
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

export interface Pedidos {
    idPedido:     string;
    fecha:        string;
    usuario:      string;
    estadoPedido: string;
    importe:      number;
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
    unsorted: boolean;
    sorted:   boolean;
}
