library(rvest)

url <- 'https://www.loteriasyapuestas.es/es/la-quiniela/sorteos/2018/1032606047'

#url <- 'https://www.loteriasyapuestas.es/es/la%2Dquiniela/sorteos/2013/836606023'
for(i in 1:2000){
    # scrape HTML from website
    link<-url %>% read_html() %>% 
        html_node(css = '.contenedorEnlaces') %>% 
        html_node(css='.resultadoAnterior') %>%
        html_node('a')%>%html_attr('href')
    print(link)
    url<-paste('https://www.loteriasyapuestas.es',link,sep = "")
    print(url)
    print(i)
}
#A vegades dona el error:
#Error in open.connection(x, "rb") : 
#Timeout was reached: Operation timed out after 0 milliseconds with 0 out of 0 bytes received

#Quan la plana no te el enllaç dona el error:
#Error in UseMethod("xml_find_first") : 
#    no applicable method for 'xml_find_first' applied to an object of class "xml_missing"