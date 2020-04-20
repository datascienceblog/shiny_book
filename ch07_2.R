library(shiny)

ui <- fluidPage(
  titlePanel('calculator'),
  wellPanel(
    p('Choose two numbers and the operator...')
  ),
  textInput("num1", "number 1:", value=30),
  textInput("num2", "number 2:"),
  radioButtons("cal", "operator:", c("+"="add", "-"="sub", "*"="mul", "/"="div"), inline=TRUE),
  h2("result"),
  textOutput("result"),
  actionButton("beReactive", "Reflect value!"),
  textOutput("result2")
)

server <- function(input, output, session) {
  outputTxt <- reactive({
    req(input$num1, input$num2)
    num1 <- as.numeric(input$num1)
    num2 <- as.numeric(input$num2)
    switch(input$cal,
           "add"={paste(num1, "+", num2, "=", num1+num2)},
           "sub"={paste(num1, "-", num2, "=", num1-num2)},
           "mul"={paste(num1, "*", num2, "=", num1*num2)},
           "div"={paste(num1, "/", num2, "=", round(num1/num2,2))}
           )
  })
  
  output$result <- renderText({
    outputTxt()
  })
  
  output$result2 <- renderText({
    input$beReactive
    paste("1st value:", isolate(input$num1))
  })
  
  observe({
    cat(outputTxt(), "\n")
  })
}

shinyApp(ui, server)
