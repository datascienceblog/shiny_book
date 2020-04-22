library(shiny)

ui <- fluidPage(
  titlePanel("Name & Age"),
  
  textInput("myName", "name", placeholder="Input name"),
  numericInput("myAge", "age", value=NULL, min=1, max=110),
  textOutput("mine)")
)

server <- function(input, output, session) {
  output$mine <- renderText({
    validate(
      need(input$myName != '', message="Name is mandatory"),
      need(input$myAge != '', message="Age is mandatory")
    )
    paste("You name is ", input$myName, " and your age is ", input$myAge, ".")
  })
}

shinyApp(ui, server)
