library(shiny)

ui <- fluidPage(
  verbatimTextOutput("txt")
)

server <- function(input, output, session) {
  output$txt <- renderPrint({
    query <- session$clientData$url_search
    if (query=="") return ("input query like '?x=mtcars'")
    q_list <- unlist(parseQueryString(query))
    data <- get(q_list)
    data
  })
}

shinyApp(ui, server)

#http://127.0.0.1:3192/?x=mtcars