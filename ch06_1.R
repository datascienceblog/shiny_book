library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Radio button sample"),

    # Sidebar with a slider input for number of bins 

    radioButtons("dist","Distribution type:",
        c("Normal"="norm",
          "Uniform"="unif",
          "Log-normal"="lnorm",
          "Exponential"="exp")),
    plotOutput("distPlot")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        dist <- switch(input$dist,
                       norm=rnorm,
                       unif=runif,
                       lnorm=rlnorm,
                       exp=rexp,
                       rnorm)
        
        hist(dist(10000))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
