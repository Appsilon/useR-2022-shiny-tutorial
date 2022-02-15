box::use(
  shiny[NS, div, h4, textInput, tagList, textOutput, renderText, moduleServer,
        req],
  stringr[str_squish],
)

ui <- function(id, label) {
  ns <- NS(id)
  tagList(
    textInput(inputId = ns("texto_in"), label = label),
    div(
      class = "well",
      textOutput(outputId = ns("texto_out"))
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$texto_out <- renderText({
      req(input$texto_in)
      # Pista
      #  str_replace_all(string = "input_text_aca", pattern = "[0-9]", replacement = "")
      str_squish(input$texto_in)
    })
  })
}
