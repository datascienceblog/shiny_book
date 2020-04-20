library(shiny)

ui <- fluidPage(
  actionButton("do", "실행"),
  plotOutput("rnorm"),
  plotOutput("runif")
)

server <- function(input, output, session) {
  observeEvent(input$do, {
    output$rnorm <- renderPlot({
      hist(rnorm(10000))
      #hist(runif(10000))
    })
    output$runif <- renderPlot({
      #hist(rnorm(10000))
      hist(runif(10000))
    })
  })
}

shinyApp(ui, server)