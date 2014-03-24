

# read in data
data <- read.table("./test3.txt")

pdf('landscape.pdf')

plot(data[,2], type = "l")
lines(data[,3], col = 2)
lines(data[,4], col = 3)

dev.off()








