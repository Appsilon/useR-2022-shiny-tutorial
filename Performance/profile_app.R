library(shiny)
library(DT)
library(utils)

download.file("https://github.com/owid/energy-data/raw/master/owid-energy-data.csv",
              "datos/energia_mundial.csv")

ui <- function() {
  DTOutput("table")
}


  
server <- function(input, output) {
  data <- read.csv("datos/energia_mundial.csv", header = TRUE)
  output$table <- renderDT({
    datatable(
      data,
      selection = "single"
    )
  })

}

shinyApp(ui, server)