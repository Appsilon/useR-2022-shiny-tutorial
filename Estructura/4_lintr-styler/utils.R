crear_titulo <- function(titulo) {
  assertthat::assert_that(rlang::is_string(titulo))

  paste("Cantidad de numeros de telefono en", titulo)
}

funcionGenial <- function(x = 1,
                          y = 2) {
  (x + y) / 2
}

# nolint start
funcionGenial2 <- function(x = 1,
                          y = 2) {
  (x + y) / 2
}
# nolint end
