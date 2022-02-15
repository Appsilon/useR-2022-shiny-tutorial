library(shiny)
library(ggplot2)
library(shiny.semantic)

source("utils.R")
constants <- config::get(file = "constants/config.yml")

ui <- semanticPage(
  title = constants$titulo,
  titlePanel("Telefonos por region"),
  sidebar_layout(
    sidebar_panel(
      tagList(
        p("Region:"),
        dropdown_input(
          input_id = "region",
          choices = colnames(WorldPhones)
        )
      ),
      hr(),
      helpText("Datos de AT&T (1961) The World's Telephones.")
    ),
    main_panel(
      plotOutput("phonePlot")
    )
  )
)

server <- function(input, output, session) {
  Mivariable <- 3
  
  una_lista_muy_larga <- list("hola", "chau", "nombres muy largos", 1234, NULL, NA, logical(), "xyz")
  
  NombreFeo <- "a"
  
  QuieroEsteNombreAsi <- "a" # nolint
  
  output$phonePlot <- renderPlot({
    req(input$region)
    data <-  data.frame(x = rownames(WorldPhones),
                        y = WorldPhones[, input$region] * 1000)
    ggplot(data, aes(x, y)) +
      geom_col() +
      labs(
        x = "Año",
        y = "Cantidad de Telefonos",
        title = crear_titulo(input$region) # aca esta nuestra funcion
      )
  })
}

shinyApp(ui, server)
