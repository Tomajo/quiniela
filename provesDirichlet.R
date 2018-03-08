# install.packages("devtools")
devtools::install_github("dkahle/dirichlet")
library(dirichlet)
library(dplyr)
library(ggplot2); theme_set(theme_bw())
f <- function(v) ddirichlet(v, c(20, 10, 5))
mesh <- simplex_mesh(.0025) %>% as.data.frame %>% tbl_df
mesh$f <- mesh %>% apply(1, function(v) f(bary2simp(v)))

(p <- ggplot(mesh, aes(x, y)) +
        geom_raster(aes(fill = f)) +
        coord_equal(xlim = c(0,1), ylim = c(0, .85)))


# Prova de que la funcio fa el que crec que fa
# diri<-rdirichlet(10000,c(0.1,0.3,0.6))
# sum(diri[,1])/10000
# sum(diri[,2])/10000
# sum(diri[,3])/10000

