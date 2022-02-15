library(testthat)

strings_invalidos <- list(
  0, NULL, list(1, 2), TRUE, FALSE, logical(), character(), data.frame("a" = c(1:10))
)

test_that("crear_titulo devuelve un objeto de tipo character.", {
  expect_type(
    crear_titulo("hola"),
    "character"
  )
})

test_that("crear_titulo da error si no paso un string", {
  for (invalid_arg in strings_invalidos) {
    expect_error(
      crear_titulo(invalid_arg)
    )
  }
})
