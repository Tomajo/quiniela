library(RCurl)
myfile <- getURL('http://www.loteriasyapuestas.es/f/loterias/documentos/Quiniela/Estad%C3%ADsticas%20de%20pron%C3%B3sticos/pronos_1X2_46_S.txt', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE,.encoding = 'UTF-8')
mydat <- read.csv(textConnection(myfile), skip = 2,sep = ';',header = FALSE)
head(mydat)
