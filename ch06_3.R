#conditionalPanel()

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Diamonds data"),
  
  selectInput("plotType", "Plot Type",
              c(Scatter="scatter", Histogram="hist")
  ),
  #Only show this panel if the plot type is a histogram
  conditionalPanel(
    condition="input.plotType=='hist'",
    selectInput(
      "breaks", "Breaks",
      c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]"="custom")
    ),
    
    conditionalPanel(
      condition="input.breaks=='custom'",
      sliderInput("breakCount", "BreakCount", min=1, max=1000, value=10)
    )
  ),
  
  plotOutput("plot")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  brs <- reactive({
    if (input$breaks=="custom") {
      input$breakCount
    } else {
      input$breaks
    }
  })
  
  p <- reactive({
    if (input$plotType == "scatter") {
      plot(diamonds$carat, diamonds$price, col="red")
    } else {
      hist(diamonds$carat, breaks=brs())
    }
  })
  
  output$plot <- renderPlot({
    p()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
