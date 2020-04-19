# insertUI(), removeUI()

library(shiny)
library(stringr)

ui <- fluidPage(
  actionButton("add", "Add UI"),
  verbatimTextOutput("allText")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    insertUI(
      selector="#add",
      where="afterEnd",
      ui=textInput(paste0("txt",input$add),
                   "Insert some text", placeholder="Input text.")
    )
  })
  
  output$allText <- renderPrint({
    req(input$add)
    txts <- unlist(lapply(seq(1, input$add), function(x) paste0("txt", x)))
    paste(unlist(lapply(txts, function(x) str_trim(input[[x]]))), collapse=" ")
  })
}

shinyApp(ui, server)