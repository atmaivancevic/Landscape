


library(ggplot2)
library(reshape2)
library(plot3D)
library(scatterplot3d)

setwd("/Users/atma/Downloads/")

data <- read.table("test.txt")
data
#data <- read.table("test.txt", colClasses = c("NULL", rep("numeric", count.fields("test.txt")[1] -2)))
#data


data2 <- data[, colSums(data) != 0]
data2

nrow(data2)
ncol(data2)

x <- c(0:(nrow(data2)-1))
x

y <- 1:ncol(data2)
y

z <- data2
z

# plot first triangle to set up the graph window
plot(x, data2[,2], type = "l")

# plot first triangle to set up the graph window
#plot(data2[,1], data2[,2], type = "l")

data3 <- melt(data2, id=1:1)
data3

x = data3[,1]
y = data3[,3]
y

x1 = x[1:15]

y1 = y[1:15]
y1
y2 = y[16:30]
y2
y3 = y[31:45]
y3


z1 <- c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
z2 <- c(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
z3 <- c(3,3,3,3,3,3,3,3,3,3,3,3,3,3,3)


s3 <- polygon3D(z3,x1,y3,  xlim=c(0,4), ylim=c(0,14), zlim=c(0,5), col="blue", theta=70, phi=40, xlab="z", ylab="x", zlab="y")

s2 <- polygon3D(z2,x1,y2, xlim=c(0,4), ylim=c(0,14), zlim=c(0,5), xlab="z", ylab="x", zlab="y", col="dark green", theta=70, phi=40, add=TRUE)

s1 <- polygon3D(z1,x1,y1, xlim=c(0,4), ylim=c(0,14), zlim=c(0,5), xlab="z", ylab="x", zlab="y", col="red",  theta=70, phi=40, add=TRUE)





#s3 <- polygon3D(x1,y3,z3,  xlim=c(0,14), ylim=c(0,5), zlim=c(0,4), col=1, theta=20, phi=40 )
#no <- 3
#for ( i in seq(no-1)){
	
	#s2 <- polygon3D(x1,y2,z2, xlim=c(0,14), ylim=c(0,5), zlim=c(0,4), col=(no+1), theta=20, phi=40, add=TRUE)

#}













