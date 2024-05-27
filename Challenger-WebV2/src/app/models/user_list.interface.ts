export interface UserListResponse {
    content:          Usuarios[];
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

export interface Usuarios {
    idUsuario:        string;
    username:         string;
    email:            string;
    avatar:           string;
    horasDisponibles: number;
    createdAt?:        Date;
    rol:              string;
    activo:           boolean;
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
