crear_titulo <- function(titulo) {
  assertthat::assert_that(rlang::is_string(titulo))

  paste("Cantidad de numeros de telefono en", titulo)
}
