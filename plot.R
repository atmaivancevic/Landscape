

library(ggplot2)
library(reshape2)

setwd("/Users/atma/GenomeAnalysis/BovB/Horse/Orlandos_Horses/BovbIntervals/")

data <- read.table("Landscape1.txt")

# plot first triangle to set up the graph window
plot(data[,1], data[,2], type = "l")

data2 <- melt(data, id=1:1)

ggplot(data2, aes(data2[,1], value, col=variable)) + geom_line() + 
xlab("") + 
ylab("") +
theme(legend.position="none") +
ggtitle("Persistence Landscape of Equid BovB Interval 1")














