library(shiny)
library(plotly)
library(dplyr)

data <- read.csv("../../datos/energia_mundial.csv", header = TRUE)

ui <- function() {
  bootstrapPage(
    selectInput("pais", "Seleccionar Pais", choices = unique(data$country)),
    plotlyOutput("plot")
  )
}
  
server <- function(input, output) {
  plot_data <- reactive({
    data %>% dplyr::filter(country == input$pais)
  })
  
  output$plot <- renderPlotly({
    p <- ggplot(plot_data(), aes(x = year, y = gdp )) + geom_line()
    ggplotly(p)
  })
}

shinyApp(ui, server)