library(rvest)
library(stringr)


#TODO: Començar a guardar dades ja formatejades, revisar quan hi ha dades i quan hi no hi ha perquè no peti.

#Depen del getUrlQuiniela.R
urlsJornades<-readRDS(file = "data/urlsJornades.rds")

Sys.setlocale(locale='es_ES.UTF8')

#for(i in 1:length(urlsJornades)){
for(i in 1:5){
        url<-paste("https://www.loteriasyapuestas.es",urlsJornades[i],sep = "")
        print(paste("Principi bucle",url))
        download.file(url, destfile = "scrapedpage.html", quiet=TRUE)
        planaHtml <- read_html("scrapedpage.html")
        #planaHtml<-url %>% read_html()
        Jornada<-planaHtml%>% 
            html_nodes(css = '.tituloRegion')%>%html_nodes("h2") %>%html_text()
        #inicialitzo la jornada 
        dataJornada<-NULL
        dataJornada<-as.Date(gsub('de','',sub(".*, ", "", Jornada[2])),format = '%A %d %B %Y')
        
        #recaudacio Bote i premis
        DadesGen<-planaHtml %>% 
            html_nodes(css = '.cuerpoRegionSup')%>%html_nodes("p") %>%html_text()
        #inicialitzo recaudacio Bote i premis
        Recaudacio<-NULL
        Bote<-NULL
        Premis<-NULL
        Recaudacio<-gsub("\\,",".",gsub("[^0-9,]","",DadesGen[1]))
        Bote<-gsub("\\,",".",gsub("[^0-9,]","",DadesGen[2]))
        Premis<-gsub("\\,",".",gsub("[^0-9,]","",DadesGen[3]))
        
        numeroPartit<-planaHtml %>% 
            html_nodes(css = '.cuerpoRegionLeft') %>% 
            html_nodes(".derecha")  %>% 
            html_nodes("li") %>%html_text()
        PrimerEquip<-planaHtml%>%
            html_nodes(xpath = '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[2]') %>%html_nodes("li")%>%html_text()
        SegonEquip<-planaHtml %>%
            html_nodes(xpath = '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[3]') %>%html_nodes("li")%>%html_text()   
        Gols<-planaHtml %>%
            html_nodes(xpath = '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[1]') %>%html_nodes("li")%>%html_text() 
        ResultatQuiniela<-planaHtml %>%
            html_nodes(xpath = '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[2]') %>%html_nodes("li")%>%html_text() 
        
        
        taulaPremis <- html_table(planaHtml)[1]
 
        linkTxt<-planaHtml %>% html_nodes(xpath ='//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[3]/div[2]/ul/li/div[4]/ul/li/div/h3/a') %>%  html_attr('href')    

}


