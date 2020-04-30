library(shiny)
library(miniUI)

myG <- function(myData) {
  ui <- miniPage(
    gadgetTitleBar("연습장"),
    verbatimTextOutput("txt")
  )

  server <- function(input, output, session) {
    output$txt <- renderPrint({
      head(myData)
    })
    
    observeEvent(input$done, {
      k <- lapply(myData, class)
      stopApp(k)
    })
  }
  
  runGadget(shinyApp(ui, server))
}

myG(mtcars)
#myG(iris)
