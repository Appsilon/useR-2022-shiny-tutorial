library(shiny)

ui <- function() {
  fluidPage(
    title = "Ejemplo 1",
    fluidRow(
      h2("Ejemplo 1 - Sin usar módulos", style = "margin-left: 50px"),
      column(
        width = 6,
        class = "col-sm-offset-4",
        selectizeInput(
          inputId = "categoria",
          label = "Seleccione una Categoría",
          choices = LETTERS[1:5]
        ),
        selectizeInput(
          inputId = "tipo",
          label = "Seleccione un tipo",
          choices = LETTERS[6:10]
        ),
        div(
          class = "well",
          textOutput("letra_seleccionada_categoria"),
          textOutput("letra_seleccionada_tipo")
        )
      )
    )
  )
}

server <- function(input, output, session) {
  output$letra_seleccionada_categoria <- renderText({
    sprintf("Categoría seleccionada: %s", input$categoria)
  })
  output$letra_seleccionada_tipo <- renderText({
    sprintf("Tipo seleccionado: %s", input$tipo)
  })
}

shinyApp(ui, server)
