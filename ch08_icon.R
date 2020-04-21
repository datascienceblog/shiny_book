# 폰트오썸 http://fontawesome.io/icons
# 글리피콘 http://getbootstrap.com/components/#glyphicons

library(shiny)
#library(shinythemes)

ui <- navbarPage("icon practice", theme=shinythemes::shinytheme("united"),
                 tabPanel("Plot", ico=icon("bar-chart-o")),
                 tabPanel("Summary", ico=icon("list-alt")),
                 tabPanel("Table", ico=icon("table"),
                          actionButton("btn", "View Update", icon=icon("refresh"))
                          )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)