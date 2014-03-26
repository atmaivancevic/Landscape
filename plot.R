

library(ggplot2)
library(reshape2)

setwd("/Users/atma/GenomeAnalysis/BovB/Horse/Orlandos_Horses/BovbIntervals/")

data <- read.table("Landscape12.txt")
#data

#data <- read.table("Landscape1.txt", colClasses = c("NULL", rep("numeric", count.fields("Landscape1.txt")[1] -2)))
#data

#Remove columns which contain only zeros
data2 <- data[, colSums(data) != 0]
#data2

nrow(data2)
ncol(data2)

#x <- 0:(nrow(data2)-1)
#x

#z <- 1:ncol(data2)
#z

# plot first triangle to set up the graph window
plot(data2[,1], data2[,2], type = "l")

data3 <- melt(data2, id=1:1)
#data3

ggplot(data3, aes(data3[,1], value, color=variable)) + geom_line() + 
xlab("Chromosome Position (bp)") + 
ylab("") +
#theme(legend.position="none") +
ggtitle("Persistence Landscape of Equid BovB Interval 12 (chr7, - strand)")





