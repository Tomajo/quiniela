library(XML)
library(stringr)
library(RCurl)
library(RMySQL)

#poso en castella per tractar les dates etc
Sys.setlocale(locale='es_ES.UTF8')
###############################################################
# Llegim la plana de ONLAE de Quinieles i agafem tota la      #
# informació que ensinteressa                                 #
###############################################################

print(url)
urlhttps <- getURL('https://www.loteriasyapuestas.es/es/la-quiniela/sorteos/2018/1034006050', ssl.verifypeer = FALSE)
# Agafem aquesta primera URL. Aquesta no la llegirem, és el punt de partida per llegir totes les anteriors.
doc.html = htmlTreeParse(urlhttps,useInternalNodes = TRUE)


#obro connexió a la base de dades
mydb <- dbConnect(MySQL(), user='root', password='B4yesian', dbname='QUINIELA', host='127.0.0.1')
for(i in 1:3000){
    # Sys.sleep(1)
    #agafo url relativa anterior i concateno amb la url de ONLAE
    doc.linkA = unlist(xpathApply(doc.html,'//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[2]/div[1]/a/@href'))
    
    if(!is.null(doc.linkA)){
        #Agafo url de la jornada anterior i faig el canvi
        print(doc.linkA)
        urlActual<-paste(url,doc.linkA,sep = '') 
        doc.html = htmlTreeParse(getURL(urlActual, ssl.verifypeer = FALSE),useInternalNodes = TRUE)
        #Agafo les dades...
        #Jornada i data
        doc.textA = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[1]/div/h2', xmlValue))
        
        doc.jornada<-sub("\\s*,.*", "", doc.textA)
        doc.dataJornada<-sub(".*, ", "", doc.textA)
      
        #agafo data de la jornada
        doc.dataJornada<-as.Date(gsub('de','',doc.dataJornada),format = '%A %d %B %Y')
        
        #apostes
        doc.textB0 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/p[1]', xmlValue))
        #Recaudació 
        doc.textB1 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/p[2]', xmlValue))
        
        #Bote
        doc.textB2 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/p[3]', xmlValue))
        #Premis
        doc.textB3 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[1]/p[4]', xmlValue))
        
        #Ordre de partits
        doc.text0 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[1]/li', xmlValue))
        # # Primera columna amb els números de partits
        doc.text1 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[1]/li', xmlValue))
        # # segona columna amb els equips que juguen a casa
        doc.text2 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[2]/li', xmlValue))
        # # Tercera columna amb els equips que juguen fora
        doc.text3 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[3]/ul[3]/li', xmlValue))
        # # Quarta columna amb els resultats en gols
        doc.text4 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[1]/li', xmlValue))
        # # Cinquena columna amb els resultats en 1-X-2
        doc.text5 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[4]/ul[2]/li', xmlValue))
        # #Pleno al quince 1er equip
        doc.text6 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[2]/ul[2]/li', xmlValue))
        # #Pleno al quince 2on equip
        doc.text7 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[2]/ul[3]/li', xmlValue))
        # #Resultat pleno gols
        doc.text8 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[3]/ul[1]/li', xmlValue))
        # #Resultat pleno  en format quiniela abreujat M-1 etc
        doc.text9 = unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[2]/div[2]/div[5]/div[3]/ul[2]/li', xmlValue))
        # 
        # #Header premis
        doc.text10 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[2]/td', xmlValue))
        # 
        # #Ple al 15
        doc.text11 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[2]/td', xmlValue))
        # 
        # #14 encerts
                                                
        doc.text12 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[3]/td', xmlValue))
        # #13 encerts
        doc.text13 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[4]/td', xmlValue))
        # #12 encerts
        doc.text14 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[5]/td', xmlValue))
        # #11 encerts
        doc.text15 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[6]/td', xmlValue))
        # #10 encerts
        doc.text16 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[2]/div/table/tbody/tr[7]/td', xmlValue))
        
        # 
        # ###########################################################
        # # Llegim les apostes que ha fet la gent                   # 
        # #                                                         #
        # ###########################################################
        # 
        # #agafo link amb la estadistica de apostes que ha fet la gent, em servirà per predir quines apostes tendeix a fer la gent, etc.
        doc.linkB  =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[3]/div[2]/ul/li/div[3]/ul/li/div/h3/a/@href'))
        doc.linkB2 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[3]/div[2]/ul/li/div[2]/ul/li/div/h3/a/@href'))
        doc.linkB3 =unlist(xpathApply(doc.html, '//*[@id="idContainerLoteriaNacional"]/div[1]/div[2]/div/div[3]/div[3]/div[2]/ul/li/div[4]/ul/li/div/h3/a/@href'))
                                                 
        
        print(paste('Agafo txt de la Jornada? ',doc.linkB))
        print(paste('Agafo txt de la Jornada? ',doc.linkB2))
        print(paste('Agafo txt de la Jornada? ',doc.linkB3))
        #Miro si el txt esta en algun dels llocs previstos
        if(length(grep('txt',doc.linkB))==0 && length(grep('txt',doc.linkB2))==0 && length(grep('txt',doc.linkB3))==0 ) {
             print(paste('No agafo txt de la Jornada ',doc.textA))
             mydat<-data.frame(matrix(NA, nrow = 16, ncol = 6)) 
         }else{
             #si no està en un lloc està en el altre, li passo el link correcte
             if(length(grep('txt',doc.linkB))!=0) {
                 print(paste('Agafo txt de la Jornada de la primera casuística ',doc.linkB))
 
             } else 
             if(length(grep('txt',doc.linkB2))!=0) {
                 print(paste('Agafo txt de la Jornada de la segona casuística ',doc.linkB2))
                 doc.linkB<-doc.linkB2 
             }    
             if(length(grep('txt',doc.linkB3))!=0) {
                 print(paste('Agafo txt de la Jornada de la tercera casuística ',doc.linkB3))
                 doc.linkB<-doc.linkB3 
             }    
             urlApostesJornada<-paste(url,doc.linkB,sep = '') 
             myfile <- getURL(URLencode(urlApostesJornada), ssl.verifyhost=FALSE, ssl.verifypeer=FALSE,.encoding = 'UTF-8',async = TRUE)
             mydat <- read.csv(textConnection(myfile), skip = 2,sep = ';',header = FALSE)
             print(mydat)
        #TODO: Falta agafar el pronostics, formatejarlos i posar-los a BBDD.
        #     
         } 
        # 
        # 
        # ###########################################################
        # # Compossem tota la informació en una estructura que      #
        # # ens vingui bé                                           # 
        # ###########################################################    
        # 
        # #partits del 1 al 14. El ple al 15 el tractem a part.
        df114<-cbind(doc.jornada,as.character.Date(doc.dataJornada),doc.text2,doc.text3,doc.text4,doc.text5,mydat[1:14,c(3,4,5)])
        colnames(df114)<-c('JORNADA','DATA','EQUIP_CASA','EQUIP_VISITANT','MARCADOR','RESULTAT','APOSTES1','APOSTESX','APOSTES2')

        dbWriteTable(mydb, 'RESULTATS', df114, row.names=F, append=T)
        print(paste('Entrant dades: ',doc.textA))
        # 
        # #Recaudació, encertants i premis
        dfRecPrem<-rbind(doc.text11[1:3],doc.text12[1:3],doc.text13[1:3],doc.text14[1:3],doc.text15[1:3],doc.text16[1:3])
        dfRecPrem[,2]<-gsub("\\.", "", dfRecPrem[,2])
        dfRecPrem[,3]<-gsub(",", ".", gsub("\\.", "", gsub('€','',dfRecPrem[,3])))
        #TODO: fer gols a favor en contra a casa i fora??? Revisar model de Poisson etc.
        
        #revisar si formatejo be les dades a entrar a la BBDD
        dfRecPrem<-cbind(rep(doc.jornada,3),as.character.Date(rep(doc.dataJornada,3)),dfRecPrem)
        dfRecPrem<-as.data.frame(dfRecPrem)
        colnames(dfRecPrem)<-c('JORNADA','DATA','CATEGORIA','ENCERTANTS','PREMI')
        print(dfRecPrem)                 
        dbWriteTable(mydb, 'PREMIS', dfRecPrem, row.names=F, append=T)
    }
}
dbDisconnect(mydb)

