library(shiny)

ui <- fluidPage(
  wellPanel(
    p("console, Shiny.onInput('myText','input text')")
  ),
  verbatimTextOutput("txt")
)

server <- function(input, output, session) {
  output$txt <- renderPrint({
    req(input$myText)
    input$myText
  })
}

shinyApp(ui, server)
