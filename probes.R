
Mitjana<-c()

for(j in 1:1000){
    Encerts <-c()
    for(i in 1:20){
        df <- runif(n=15)
        df<-df[df[]>0.59]
        Encerts<-c(Encerts,15-length(df))
    }
    
    #de les proves tontes amb les dades que tinc...
    #si encerto 14 amb més de 100 encertants de mitja m'enporto: 3000 aprox
    #si encerto 13 amb més de 100 encertants de mitja m'enporto: 1000 aprox
    #si encerto 12 amb més de 100 encertants de mitja m'enporto: 300 aprox
    #si encerto 11 amb més de 100 encertants de mitja m'enporto: 40 aprox
    #si encerto 10 amb més de 100 encertants de mitja m'enporto: 7 aprox
    
    pasta<-sum(Encerts[]==14)*(3000+choose(14,13)*1000+choose(14,12)*300+choose(14,11)*40+choose(14,10)*7)+sum(Encerts[]==13)*(1000+choose(13,12)*300+choose(13,11)*40+choose(13,10)*7)+sum(Encerts[]==12)*(300+choose(12,11)*40+choose(12,10)*7)+sum(Encerts[]==11)*(40+choose(11,10)*7)
    +sum(Encerts[]==10)*7
    print(append('invertit ',i*100))
    print(append('pasta ',pasta))
    print(c('Benefici ',round(100*((pasta/(i*100))-1)),' % '))
    print(summary(Encerts))
    
    Mitjana<-c(Mitjana,round(100*((pasta/(i*100))-1)))
    
}
print(c('Benefici mitjà',mean(Mitjana),' %'))