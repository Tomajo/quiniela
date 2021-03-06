library(XML)
library(stringr)
library(RCurl)
library(RMySQL)

###############################################################
# Llegim la plana de ONLAE de Quinieles i agafem tota la      #
# informació que ensinteressa                                 #
###############################################################
# Agafem aquesta primera URL. Aquesta no la llegirem, és el punt de partida per llegir totes les anteriors.
doc.html = htmlTreeParse('http://www.loteriasyapuestas.es/es/la-quiniela/sorteos/2016/946506028',useInternalNodes = TRUE)

url<-'http://www.loteriasyapuestas.es'


#obro connexió a la base de dades
mydb <- dbConnect(MySQL(), user='root', password='vigil0Me', dbname='QUINIELA', host='127.0.0.1')
for(i in 1:10){
    #agafo url relativa anterior i concateno amb la url de ONLAE
    doc.linkA = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/a/@href'))
    if(!is.null(doc.linkA)){
        urlActual<-paste(url,doc.linkA,sep = '') 
        if(urlActual=="http://www.loteriasyapuestas.es/es/la%2Dquiniela/sorteos/2015/919606032"){
            urlActual<-'http://www.loteriasyapuestas.es/es/la-quiniela/sorteos/2015/919206031'
        }
        #parsejo nova plana 
        doc.html = htmlTreeParse(urlActual,useInternalNodes = TRUE)
        
        #Agafo les dades...
        
        #Jornada i data
        doc.textA = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[1]/div[1]/h2', xmlValue))
        #Recaudació 
        doc.textB = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/p', xmlValue))
        #Ordre de partits
        doc.text0 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[1]/li', xmlValue))
        # Primera columna amb els números de partits
        doc.text1 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[1]/li', xmlValue))
        # segona columna amb els equips que juguen a casa
        doc.text2 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[2]/li', xmlValue))
        # Tercera columna amb els equips que juguen fora
        doc.text3 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[3]/li', xmlValue))
        # Quarta columna amb els resultats en gols
        doc.text4 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[1]/li', xmlValue))
        # Cinquena columna amb els resultats en 1-X-2
        doc.text5 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[2]/li', xmlValue))
        #Pleno al quince 1er equip
        doc.text6 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[2]/ul[2]/li', xmlValue))
        #Pleno al quince 2on equip
        doc.text7 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[2]/ul[3]/li', xmlValue))
        #Resultat pleno gols
        doc.text8 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[3]/ul[1]/li', xmlValue))
        #Resultat pleno  1-X-2
        doc.text9 = unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[3]/ul[2]/li', xmlValue))
        
        #Header premis
        doc.text10 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[1]/th', xmlValue))
        
        #Ple al 15
        doc.text11 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[2]/td', xmlValue))
        
        #14 encerts
        doc.text12 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[3]/td', xmlValue))
        #13 encerts
        doc.text13 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[4]/td', xmlValue))
        #12 encerts
        doc.text14 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[5]/td', xmlValue))
        #11 encerts
        doc.text15 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[6]/td', xmlValue))
        #10 encerts
        doc.text16 =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[2]/div[1]/table/tbody/tr[7]/td', xmlValue))
        #print(paste(doc.text2[1],doc.text3[1]))
        
        ###########################################################
        # Llegim les apostes que ha fet la gent                   # 
        #                                                         #
        ###########################################################
        
        #agafo link amb la estadistica de apostes que ha fet la gent, em servirà per predir quines apostes tendeix a fer la gent, etc.
        doc.linkB =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[3]/div[2]/ul/li/div[2]/ul/li/div/h3/a/@href'))
        # print(paste('Agafo txt de la Jornada? ',doc.linkB))
        if(length(grep('txt',doc.linkB))==0){
            doc.linkB =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[3]/div[2]/ul/li/div[3]/ul/li/div/h3/a/@href'))
            print(paste('Agafo txt de la Jornada? 1er if ',doc.linkB))
        } 
        if(length(grep('txt',doc.linkB))==0){
            doc.linkB =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[3]/div[2]/ul/li/div[4]/ul/li/div/h3/a/@href'))
            print(paste('Agafo txt de la Jornada? 2on if ',doc.linkB))
        } 
        if(length(grep('txt',doc.linkB))==0){
            doc.linkB =unlist(xpathApply(doc.html, '//*[@id="subhome"]/div[3]/div[1]/div[1]/div[1]/div[3]/div[3]/div[2]/ul/li/div[5]/ul/li/div/h3/a/@href'))
            print(paste('Agafo txt de la Jornada? 3er if ',doc.linkB))
        }
        urlApostesJornada<-paste(url,doc.linkB,sep = '') 
        print(paste('Agafo txt de la Jornada? ',doc.linkB))
        myfile <- getURL(URLencode(urlApostesJornada), ssl.verifyhost=FALSE, ssl.verifypeer=FALSE,.encoding = 'UTF-8',async = TRUE)
        if(length(grep('txt',doc.linkB))==0) {
            print(paste('No agafo txt de la Jornada ',doc.textA))
            mydat<-data.frame(matrix(NA, nrow = 16, ncol = 6))
        }else{
            
            print(urlApostesJornada)
            mydat <- read.csv(textConnection(myfile), skip = 2,sep = ';',header = FALSE)
            print(mydat)
            
        } 
        
        
        ###########################################################
        # Compossem tota la informació en una estructura que      #
        # ens vingui bé                                           # 
        ###########################################################    
        
        #partits del 1 al 14. El ple al 15 el tractem a part.
        df114<-cbind(doc.textA,doc.text2,doc.text3,doc.text4,doc.text5,mydat[1:14,c(3,4,5)])
        colnames(df114)<-c('JORNADA','EQUIP_CASA','EQUIP_VISITANT','MARCADOR','RESULTAT','APOSTES1','APOSTESX','APOSTES2')
        #Todo, em falta posar un camp amb la jornada? Haig de començar a pensar en el model que vull fer.
        dbWriteTable(mydb, 'dadesquiniela', df114, row.names=F, append=T)
        print(paste('Entrant dades: ',doc.textA))
    }
}
dbDisconnect(mydb)
