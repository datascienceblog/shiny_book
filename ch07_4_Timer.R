library(shiny)

ui <- fluidPage(
  textOutput("currentTime")
)

server <- function(input, output, session) {
  timer <- reactiveTimer(1000, session)
  output$currentTime <- renderText({
    timer()
    paste("The current time is", Sys.time())
  })
}

shinyApp(ui, server)