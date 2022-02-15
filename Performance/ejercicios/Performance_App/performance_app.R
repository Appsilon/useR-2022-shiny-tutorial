library(shiny)
library(shiny.semantic)
library(DT)
library(utils)
library(plotly)


ui <- function() {
  semanticPage(
           DTOutput("table"),
           plotlyOutput("plot")
  )
}



server <- function(input, output) {
  data <- read.csv("../../datos/energia_mundial.csv", header = TRUE)
  output$table <- renderDT({
    datatable(
      data %>% 
        dplyr::filter(year == 2015) %>%
        dplyr::select(
          country,
          oil_production,
          coal_production,
          gas_production,
          gdp),
      selection = "single"
    )
  })
    
  output$plot <- renderPlotly({
    req(input$table_rows_selected)
    
    country_value <- data %>%
      dplyr::filter(year == 2015) %>%
      slice(input$table_rows_selected) %>%
      pull(country)
    data %>%
      dplyr::select(
        country,
        oil_production,
        coal_production,
        gas_production,
        year
      ) %>%
      dplyr::filter(
        country == country_value
      ) %>%
      plot_ly() %>%
      add_lines(x = ~ year, y = ~ oil_production, name = "petroleo") %>%
      add_lines(x = ~ year, y = ~ coal_production, name = "carbón") %>%
      add_lines(x = ~ year, y = ~ gas_production, name = "gas") 
  })
  
}

shinyApp(ui, server)