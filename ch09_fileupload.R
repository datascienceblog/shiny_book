library(shiny)

ui <- fluidPage(
  fileInput("selFile", "ChooseFile", buttonLabel="Choose File"),
  tableOutput("tbl")
)

server <- function(input, output, session) {
  output$tbl <- renderTable({
    req(input$selFile)
    if (endsWith(input$selFile$datapath,".csv")) {
      read.csv(input$selFile$datapath)
    } else {
      input$selFile
    }
  })
}

shinyApp(ui, server)