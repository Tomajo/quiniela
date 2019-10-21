library(rvest)
library(dplyr)
library(lubridate)


urlsJornades <-c()
#colnames(df_jornades)<-c("Enllaç")

dataInicialPeriode <- ymd(19890131)
for(i in 1:200){
    
    paste(day(dataInicialPeriode),"/",month(dataInicialPeriode),"/",year(dataInicialPeriode),sep = "")
    dataFinalPeriode<-dataInicialPeriode + days(60)
    
    novaUrl<-paste('https://www.loteriasyapuestas.es/es/buscador?startDate=',paste(day(dataInicialPeriode),"/",month(dataInicialPeriode),"/",year(dataInicialPeriode),sep = ""),"&gameId=06&type=search&endDate=",paste(day(dataFinalPeriode),"/",month(dataFinalPeriode),"/",year(dataFinalPeriode),sep = ""),sep = "")
    
    dataInicialPeriode<-dataFinalPeriode
    print(novaUrl)
    planaHtml<-novaUrl %>% read_html()
    Jornades<-planaHtml%>%
        html_nodes('.enlace') %>% html_nodes("a") %>% html_attr("href")
    
    Jornades<-Jornades[Jornades!="#"]
    urlsJornades<-append(urlsJornades,Jornades)
    
}

# Save an object to a file
saveRDS(urlsJornades, file = "data/urlsJornades.rds")
# Restore the object
#readRDS(file = "my_data.rds")
