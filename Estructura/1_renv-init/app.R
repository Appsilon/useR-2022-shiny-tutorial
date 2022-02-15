library(shiny)

ui <- fluidPage(
  titlePanel("Telefonos por region"),
  sidebarLayout(
    sidebarPanel(
      selectInput("region", "Region:", 
                  choices = colnames(WorldPhones)),
      hr(),
      helpText("Datos de AT&T (1961) The World's Telephones.")
    ),
    mainPanel(
      plotOutput("phonePlot")  
    )
  )
)

server <- function(input, output, session) {
  # aca va nuestro codigo del `LEEME`
}

shinyApp(ui, server)
