setwd("~/Google Drive/02. Academic/01. NYU/Module 2/02. Network Analytics/01. Pre Module/Twiiter Assignment/data")
#Optional Step - run if library(igraph) fails
#install.packages("igraph")

library(igraph)
g <- read.csv("~/Google Drive/02. Academic/01. NYU/Module 2/02. Network Analytics/01. Pre Module/Twiiter Assignment/data/graph_subset.txt", quote="\"")
str(g)

g1<- read.graph( file ="~/Google Drive/02. Academic/01. NYU/Module 2/02. Network Analytics/01. Pre Module/Twiiter Assignment/data/graph_subset.txt" , directed=TRUE)
summary(g1)

#Edge Width
E(g1)$width <- 1
#Arrow Width
E(g1)$arrow.width <- 0.2


plot.igraph(g1, layout=layout.kamada.kawai, vertex.size=2, vertex.color="red", vertex.label=NA)
