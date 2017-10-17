#fem discovery de les dades de les Quinieles
library(XML)
library(stringr)
library(RCurl)
library(RMySQL)
library(ggplot2)

#obro connexió a la base de dades
mydb <- dbConnect(MySQL(), user='root', password='vigil0Me', dbname='QUINIELA', host='127.0.0.1')
# rs <- dbSendQuery(mydb, "select * from PREMIS WHERE CATEGORIA LIKE '%2ª%'")
rs14 <- as.data.frame(dbGetQuery(mydb, "select * FROM PREMIS WHERE CATEGORIA LIKE '%14%' AND PREMI !=0"))
rs13 <- as.data.frame(dbGetQuery(mydb, "select * FROM PREMIS WHERE CATEGORIA LIKE '%13%' AND PREMI !=0"))
rs12 <- as.data.frame(dbGetQuery(mydb, "select * FROM PREMIS WHERE CATEGORIA LIKE '%12%' AND PREMI !=0"))
rs11 <- as.data.frame(dbGetQuery(mydb, "select * FROM PREMIS WHERE CATEGORIA LIKE '%11%' AND PREMI !=0"))
rs10 <- as.data.frame(dbGetQuery(mydb, "select * FROM PREMIS WHERE CATEGORIA LIKE '%10%' AND PREMI !=0"))

ggplot(rs14,aes(ENCERTANTS,PREMI)) + geom_jitter() +scale_x_log10()

ggplot(rs13,aes(ENCERTANTS,PREMI)) + geom_jitter() +scale_x_log10()

ggplot(rs12,aes(ENCERTANTS,PREMI)) + geom_jitter() +scale_y_log10()

ggplot(rs11,aes(ENCERTANTS,PREMI)) + geom_jitter() +scale_y_log10()

ggplot(rs10,aes(ENCERTANTS,PREMI)) + geom_jitter() +scale_y_log10()

ggplot(rs14,aes(PREMI)) + geom_density() + scale_x_log10()
ggplot(rs13,aes(PREMI)) + geom_density() + scale_x_log10()
ggplot(rs12,aes(PREMI)) + geom_density() + scale_x_log10()
ggplot(rs11,aes(PREMI)) + geom_density() + scale_x_log10()
ggplot(rs10,aes(PREMI)) + geom_density() + scale_x_log10()

dbDisconnect(mydb)



