library(shiny)

ui <- shinyUI(basicPage(
  plotOutput('plot', width='300px', height='300px'),
  actionButton('goPlot', 'Go Plot')
))

server <- function(input, output, session) {
  output$plot <- renderPlot({
    input$goPlot
    
    dat <- data.frame(x=numeric(0), y=numeric(0))
    
    withProgress(message='Making plot', value=0, {
      n <- 10
      
      for (i in 1:n) {
        dat <- rbind(dat, data.frame(x=rnorm(1), y=rnorm(1)))
        incProgress(1/n, detail=paste("Doing part", i))
        Sys.sleep(0.1)
      }
    })
    plot(dat$x, dat$y)
  })
}

shinyApp(ui, server)