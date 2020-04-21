library(shiny)
library(shinythemes)

ui <- navbarPage("App Title", theme=shinytheme("united"),
                 tabPanel("Plot"),
                 tabPanel("Chart"),
                 navbarMenu("More",
                           tabPanel("Summary"),
                           "----",
                           "Section header",
                           tabPanel("Table")
                           )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)