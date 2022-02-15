library(shiny)
library(ggplot2)
library(shiny.semantic)

ui <- semanticPage(
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
  output$phonePlot <- renderPlot({
    req(input$region)
    data <-  data.frame(x = rownames(WorldPhones),
                        y = WorldPhones[, input$region]*1000)
    ggplot(data, aes(x, y)) +
      geom_col() +
      labs(x = "Año", 
           y = "Cantidad de Telefonos",
           title = input$region)
  })
}

shinyApp(ui, server)
