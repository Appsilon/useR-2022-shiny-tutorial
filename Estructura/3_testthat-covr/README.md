Usando testthat y covr
================

## Testeando nuestras funciones

Supongamos que queremos incluir alguna funcionalidad especifica para
nuestro proyecto, y que para esto escribimos una funcion. En este caso,
vamos a usar un ejemplo de juguete con una funcion que llamamos
`crear_titulo()` que definimos en `utils.R`.

``` r
crear_titulo <- function(titulo) {
  assertthat::assert_that(rlang::is_string(titulo))

  paste("Cantidad de numeros de telefono en", titulo)
}
```

La funcion es muy sencilla, solo concatena
\``"Cantidad de numeros de telefono en"` a una variable `titulo`.
Veamosla en accion corriendo nuestra app.

------------------------------------------------------------------------

Volviendo a la funcion, vemos que le pedimos con un *assertion* que
`titulo` sea un `string`, es decir, buscamos asegurarnos de que lo que
ingresa en la funcion es lo que esperamos. Hay varios paquetes para
esto, aca usamos `{assertthat}`.

Una buena practica es testear nuestras funciones con “unit tests” para
asegurarnos de que su comportamiento es el esperado. Miremos
`tests/testthat/test-crear_titulo.R` para ejemplos de como chequear esto
con expresiones `expect_<algo>`.

Corramos los tests corriendo en consola:

``` r
testthat::test_dir('tests/testthat')
```

Vemos que nuestra funcion pasa estos tests. Se te ocurren mas para
agregar?

\*Nota: tambien se pueden testear nuestras apps, pero esto es un tema
que escapa a este tutorial.
[Aca](https://mastering-shiny.org/scaling-testing.html) pueden ver mas.

## Cuantificando nuestro testeo

Vamos a usar `covr` para generar un reporte acerca de cuan cubierto esta
nuestro codigo por unit tests. En particular, vamos a seguir el ejemplo
de juguete, y solo medir cuan cubierto esta el codigo en `utils.R` (o
sea, donde vive nuestra funcion).

Corramos en consola

``` r
covr::report(
  covr::file_coverage(
    source_files = "utils.R",
    test_files = "tests/testthat/test-crear_titulo.R"
  ),
  file = "coverage/report.html",
  browse = TRUE
)
```

Esto va a generar un reporte en HTML en `coverage/report.html` que mide
cuan cubierto esta el codigo `utils.R` con los tests en
`tests/testthat/test-crear_titulo.R`.
