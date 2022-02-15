library(shiny)

plot_ui <- function(id) {
  ns <- NS(id)
  plotOutput(outputId = ns("plot"))
}

plot_server <- function(id, data_x, data_y, titulo) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderPlot({
      plot(data_x, data_y, main = titulo)
    })
  })
}


ui <- function() {
  fluidPage(
    title = "Ejemplo 1",
    fluidRow(
      h2("Ejemplo 1 - Sin usar módulos", style = "margin-left: 50px"),
      column(
        width = 6,
        class = "col-sm-offset-4",
        plot_ui("sepalo"),
        plot_ui("petalo")
      )
    )
  )
}

server <- function(input, output, session) {
  plot_server(
    id = "sepalo",
    data_x = iris$Sepal.Length,
    data_y = iris$Sepal.Width,
    titulo = "Sepalo"
  )  
  plot_server(
    id = "petalo",
    data_x = iris$Petal.Length,
    data_y = iris$Petal.Width,
    titulo = "Petalo"
  )  
  
}

shinyApp(ui, server)
