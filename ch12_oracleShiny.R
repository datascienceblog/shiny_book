library(shiny)
library(DBI)
library(RJDBC) 

ui <- fluidPage(
  numericInput("nMins", "Enter the last X minutes to display:", 5),
  tableOutput("tbl")
)

server <- function(input, output, session) {
  output$tbl <- renderTable({
    ##Oracle 연동(Oracle 11g)
    #driver
    drv <- JDBC("oracle.jdbc.driver.OracleDriver","D:/app/client/WIN10/product/12.2.0/client_1/jdbc/lib/ojdbc8.jar")
    
    ##DB 연동
    #connection 객체 생성 (PROD)
    conn <- dbConnect(drv, "jdbc:oracle:thin:@//172.21.88.130:1521/TOPP", "BILADM", "BILADM")
    #쿼리 입력
    sql <- paste0("SELECT evnt_dt, mchn_id, loc_tp, loc_id1 FROM TOSMIG.tif_rtls_msg WHERE evnt_dt > SYSDATE - ", input$nMins, "/24/60 ORDER BY evnt_dt DESC")
    rst <- dbGetQuery(conn, sql)
    dbDisconnect(conn)

    #출력
    rst
  })
}

shinyApp(ui, server)

