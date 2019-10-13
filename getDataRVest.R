library(rvest)
library(stringr)

#url <- 'https://www.loteriasyapuestas.es/es/la-quiniela/sorteos/2018/1032606047'

#
url <- 'https://www.loteriasyapuestas.es/es/la%2Dquiniela/sorteos/2009/730006001'
for(i in 1:10){
    tryCatch(
        {
            
            download.file(url, destfile = "scrapedpage.html", quiet=TRUE)
            planaHtml <- read_html("scrapedpage.html")
            #planaHtml<-url %>% read_html()
            Jornada<-planaHtml%>% 
                html_nodes(css = '.tituloRegion')%>%html_nodes("h2") %>%html_text()
            
            DadesGen<-planaHtml %>% 
                html_nodes(css = '.cuerpoRegionSup')%>%html_nodes("p") %>%html_text()
            
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
            
            
            
            Premios <- html_table(planaHtml)[1]
            result<-tryCatch({
                linkTxt<-planaHtml %>% html_nodes(xpath ='//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[3]/div[2]/ul/li/div[4]/ul/li/div/h3/a') %>%  html_attr('href')    
            }, error = function(e) {
                print(append("Peta a la: ",Jornada))
            }, finally = {
                
            })
            
            print(url)
            print(i)
            print(Jornada)
            print(paste("Processed URL:", url))
            link<-planaHtml%>% 
                html_node(css = '.contenedorEnlaces') %>% 
                html_node(css='.resultadoAnterior') %>%
                html_node('a')%>%html_attr('href')
            print(link)
            url<-paste('https://www.loteriasyapuestas.es',link,sep = "")
            print(paste("Nova URL:", url))
            
        },
        error=function(cond) {
            print(paste("URL does not seem to exist:", url))
            print("Estic al codi d'error")
            print(cond)
        },
        warning=function(cond) {
            print(paste("URL caused a warning:", url))
            print("Here's the original warning message:")
            print(cond)
            # Choose a return value in case of warning
        },
        finally={
            # NOTE:
            # Here goes everything that should be executed at the end,
            # regardless of success or error.
            # If you want more than one expression to be executed, then you 
            # need to wrap them in curly brackets ({...}); otherwise you could
            # just have written 'finally=<expression>' 
            message("Finally")
        }
    )
    
    
}


#Quan la plana no te el enllaç dona el error:
#Error in UseMethod("xml_find_first") : 
#    no applicable method for 'xml_find_first' applied to an object of class "xml_missing"

# "https://www.loteriasyapuestas.es/es/la%2Dquiniela/sorteos/2009/730006001"
# 460
# "JORNADAS DE QUINIELA"                         
# "Jornada 31, miércoles 22 de diciembre de 2010"