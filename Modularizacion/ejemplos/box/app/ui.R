ui <- function() {
  fluidPage(
    fluidRow(
      column(
        width = 12,
        h2("Usando box y shiny modules")
      ),
      column(
        width = 3,
        texto$ui("nombre", "Nombre:")
      ),
      column(
        width = 3,
        texto$ui("apellido", "Apellido:")
      )
    )
  )
}