
Mitjana<-c()

for(j in 1:4000){
    Encerts <-c()
    invertit<-0
    for(i in 1:20){
        df <- runif(n=15)
        df<-df[df[]>0.6]
        Encerts<-c(Encerts,15-length(df))
        invertit<-invertit+100
    }
    
    #de les proves tontes amb les dades que tinc...
    #si encerto 14 amb més de 100 encertants de mitja m'enporto: 3000 aprox
    #si encerto 13 amb més de 100 encertants de mitja m'enporto: 1000 aprox
    #si encerto 12 amb més de 100 encertants de mitja m'enporto: 200 aprox
    #si encerto 11 amb més de 100 encertants de mitja m'enporto: 40 aprox
    #si encerto 10 amb més de 100 encertants de mitja m'enporto: 7 aprox
    encerto14<-3000
    encerto13<-1000
    encerto12<-200
    encerto11<-40
    encerto10<-7
    pasta<-sum(Encerts[]==14)*(encerto14+choose(14,13)*encerto13+choose(14,12)*encerto12+choose(14,11)*encerto11+choose(14,10)*encerto10)+
           sum(Encerts[]==13)*(encerto13+choose(13,12)*encerto12+choose(13,11)*encerto11+choose(13,10)*encerto10)+
           sum(Encerts[]==12)*(encerto12+choose(12,11)*encerto11+choose(12,10)*encerto10)+
           sum(Encerts[]==11)*(encerto11+choose(11,10)*encerto10)+
           sum(Encerts[]==10)*7
    print(append('invertit ',invertit))
    print(append('pasta ',pasta))
    print(c('Benefici ',round(100*(pasta/invertit)),' % '))
    print(summary(Encerts))
    Mitjana<-c(Mitjana,round(100*(pasta/invertit)))
}
print(c('Benefici mitjà',mean(Mitjana),' %'))
print(c('Benefici max',max(Mitjana),' %'))
print(c('Benefici min',min(Mitjana),' %'))