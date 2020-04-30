#library(rJava)
#Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_161')
library(DBI)
#rJava에 의존적이기 때문에, rJava 먼저 로딩해야 한다.
library(RJDBC) 

##Oracle 연동(Oracle 11g)
#driver
drv <- JDBC("oracle.jdbc.driver.OracleDriver","D:/app/client/WIN10/product/12.2.0/client_1/jdbc/lib/ojdbc8.jar")

##DB 연동
#connection 객체 생성 (PROD)
conn <- dbConnect(drv, "jdbc:oracle:thin:@//172.21.88.130:1521/TOPP", "BILADM", "BILADM")
#쿼리 입력
sql <- "SELECT evnt_dt, mchn_id, loc_tp, loc_id1 FROM TOSMIG.tif_rtls_msg WHERE evnt_dt > SYSDATE - 5/24/60 ORDER BY evnt_dt DESC"
rst <- dbGetQuery(conn, sql)
#출력
rst

dbDisconnect(conn)
