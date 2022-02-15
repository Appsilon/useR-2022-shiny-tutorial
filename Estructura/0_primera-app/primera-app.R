library(shiny)

ui <- fluidPage(
  title = "Super App",
  "¡Hola, mundo! :)"
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
