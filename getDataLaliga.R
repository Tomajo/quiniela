library(XML)
library(stringr)
library(RCurl)
library(RMySQL)

###############################################################
# Llegim la plana de Laliga i agafem tota la      #
# informació que ensinteressa                                 #
###############################################################
# Agafem aquesta primera URL. Aquesta no la llegirem, és el punt de partida per llegir totes les anteriors.
for(j in 1955:2015){
    for(i in 1:42){
        if(i<10) {
            x<-paste('0',i,sep = '')
        } else 
        {
            x<-as.character(i)
        }
        print(x)
        any<-paste(as.character(j),'-',substr(as.character(j+1),3,4),sep = '')
        url<-paste('http://www.laliga.es/estadisticas-historicas/clasificacion/primera/',any,'/jornada-',x,'/',sep = '')
        print(url)
        doc.html = htmlTreeParse(url,useInternalNodes = TRUE)
        
        #agafo la jornada
        doc.Jornada = unlist(xpathApply(doc.html, '//body/div[4]/main/section/div[1]'))
        sub('\n            Clasificación LaLiga. Temporada','',x=doc.Jornada)
        #Agafo la classificació de la jornada.
        tableNodes <- getNodeSet(doc.html, "//body/div[4]/main/section/table")
        tb <- readHTMLTable(tableNodes[[1]])
        print(tb)
        if(!is.null(tb)){
            #guardo a la base da dades...
        }
        
    }
}
