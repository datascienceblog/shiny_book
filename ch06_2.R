library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Checkbox sample"),
  
  dateRangeInput("date","Period:", 
                 start = Sys.Date(), end = Sys.Date()+7,
                 language="ko"),
  
  checkboxGroupInput("sels", "전공언어 (복수선택 가능)",
                     c("C와 그 방언들", "Java", 
                       "JavaScripts", "R", "Perl")),
  
  selectInput("choices", "다음에서 선택:",
              choices=list("컴파일 언어" = c("C++", "Java"),
                           "스크립트 언어" = c("R","JavaScript","Python"))),
  
  verbatimTextOutput("date"),
  verbatimTextOutput("langs"),
  verbatimTextOutput("choices")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$date <- renderPrint({
    input$date
  })
  
  output$langs <- renderPrint({
    input$sels
  })

  output$choices <- renderPrint({
    input$choices
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
