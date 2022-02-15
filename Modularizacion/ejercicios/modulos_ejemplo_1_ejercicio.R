library(shiny)

plot_ui <- function(id) {
  ns <- NS(id)
  plotOutput(outputId = ns("sepalo"))
}


ui <- function() {
  fluidPage(
    title = "Ejemplo 1",
    fluidRow(
      h2("Ejemplo 1 - Sin usar módulos", style = "margin-left: 50px"),
      column(
        width = 6,
        class = "col-sm-offset-4",
        plotOutput(outputId = "sepalo"),
        plotOutput(outputId = "petalo")
      )
    )
  )
}

server <- function(input, output, session) {

  output$sepalo <- renderPlot({
    plot(iris$Sepal.Length, iris$Sepal.Width, main = "Sépalos long vs ancho")
  })

  output$petalo <- renderPlot({
    plot(iris$Petal.Length, iris$Petal.Width, main = "Pétalos long vs ancho")
  })
}

shinyApp(ui, server)
