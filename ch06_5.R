# insertUI(), removeUI()

library(shiny)

ui <- fluidPage(
  actionButton("add", "Add UI"),
  actionButton("rmv", "Remove UI"),
  textInput("txt", "This is no longer useful.")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    insertUI(
      selector="#add",
      where="afterEnd",
      ui=textInput(paste0("txt",input$add),
                   "Insert some text")
    )
  })

  observeEvent(input$rmv, {
    removeUI(
      selector="#div:has(> #txt)"
    )
  })
}

shinyApp(ui, server)