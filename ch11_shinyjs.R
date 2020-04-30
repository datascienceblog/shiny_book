library(shiny)
library(shinyjs)
ui <- fluidPage(
  useShinyjs(),
  actionButton("button", "Click me"),
  textInput("text", "Text")
)

server <- function(input, output) {
  observeEvent(input$button, {
    toggle("text")
    #hide("text", anim=TRUE)
  })
}

shinyApp(ui, server)
