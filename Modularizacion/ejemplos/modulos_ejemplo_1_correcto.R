library(shiny)

letras_ui <- function(id, desde, hasta, label) {
  ns <- NS(id)
  tagList(
    selectizeInput(
      inputId = ns("letras"),
      label = label,
      choices = LETTERS[desde:hasta]
    ),
    div(
      class = "well",
      textOutput(ns("letra_seleccionada"))
    )
  )
}

letras_server <- function(id, label) {
  moduleServer(id, function(input, output, session) {
    output$letra_seleccionada <- renderText({
      sprintf("%s: %s", label, input$letras)
    })
  })
}

ui <- function() {
  fluidPage(
    title = "Ejemplo 1",
    fluidRow(
      h2("Ejemplo 1", style = "margin-left: 50px"),
      column(
        width = 6,
        class = "col-sm-offset-4",
        letras_ui(
          id = "categoria",
          desde = 1,
          hasta = 5,
          label = "Seleccione una Categoría"
        ),
        letras_ui(
          id = "tipo",
          desde = 6,
          hasta = 10,
          label = "Seleccione un Tipo"
        )
      )
    )
  )
}

server <- function(input, output, session) {
  letras_server(id = "categoria", label = "Categoría seleccionada")
  letras_server(id = "tipo", label = "Tipo seleccionado")
}

shinyApp(ui, server)
