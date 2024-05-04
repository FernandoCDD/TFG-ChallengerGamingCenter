package com.salesianostriana.dam.challengerapi.categoria.controller;

import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaConProductosDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaDto;
import com.salesianostriana.dam.challengerapi.categoria.dto.GetCategoriaSinProductosDto;
import com.salesianostriana.dam.challengerapi.categoria.model.Categoria;
import com.salesianostriana.dam.challengerapi.categoria.service.CategoriaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/categoria")
@RequiredArgsConstructor
public class CategoriaController {

    private final CategoriaService categoriaService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener Categorías", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetCategoriaDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "nombre": "Tapas",
                                                "cantProductos": "3"

                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Categoría no encontrada", content = @Content)
    })
    @Operation(summary = "getAllCategorias", description = "Obtener una lista de categorías")
    @GetMapping("/")
    public Page<GetCategoriaDto> getAllCategoriasConCantidadDeProductos(@PageableDefault(page=0, size =4) Pageable pageable){

        return categoriaService.getCategoriasConCantidadProductos(pageable);
    }

    @Operation(summary = "createCategoria", description = "Crea una categoría.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Obtener Categorías", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetCategoriaDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "nombre": "Bebidas",
                                                "imagenUrl": "imagenUrl.jpg"                                            
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Bad Request", content = @Content)
    })
    @PostMapping("/admin/add")
    public ResponseEntity<GetCategoriaSinProductosDto> createCategoria (@Valid @RequestBody GetCategoriaDto nuevaCategoria){
        Categoria cat = categoriaService.createCategoria(nuevaCategoria);

        return ResponseEntity.status(201).body(GetCategoriaSinProductosDto.of(cat));
    }

    @Operation(summary = "Edita el nombre de una categoría existente")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Categoria.class)),
                            examples = @ExampleObject(
                                    value = """
                    [
                         {
                            "nombre": "nombre",
                            "imagenUrl": "imagenUrl.jpg"
                         }
                    ]
                    """
                            )
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Not Found",
                    content = @Content
            )
    })
    @PutMapping("/admin/edit/{idCategoria}")
    public GetCategoriaSinProductosDto editCategoria(@Valid @RequestBody GetCategoriaDto categoriaEditada,
                                         @PathVariable UUID idCategoria){

        Categoria cat = categoriaService.editCategoria(categoriaEditada, idCategoria);

        return GetCategoriaSinProductosDto.of(cat);

    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Categoría eliminada con exito", content = @Content),
            @ApiResponse(responseCode = "404", description = "Categoría no encontrada", content = @Content)
    })
    @Operation(summary = "deleteCategoria", description = "Eliminar Categoría por UUID")
    @DeleteMapping("/admin/delete/{idCategoria}")
    public ResponseEntity<?> deleteCategoria(@PathVariable UUID idCategoria){

        categoriaService.deleteCategoria(idCategoria);

        return ResponseEntity.noContent().build();
    }
}
