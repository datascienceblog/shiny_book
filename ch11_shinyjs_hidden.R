library(shiny)
library(shinyjs)
ui <- fluidPage(
  useShinyjs(),
  actionButton("button", "Click me"),
  hidden(
    textInput("text", "Text")
  )
)

server <- function(input, output) {
  observeEvent(input$button, {
    show("text")
  })
}

shinyApp(ui, server)
