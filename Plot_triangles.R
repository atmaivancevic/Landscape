
# read in data
data <- read.table("~/Desktop/test2.txt")

# get a unique set of IDs to identify each triangle
ID <- unique(data[,3])

# plot first triangle to set up the graph window
plot(data[data[,3] == 1, 1:2], type = "l")

# run through and draw triangles that correspond to the remainder of the IDs 
# remember  to skip the first one as it's already been drawn
# also remember to keep "col" changing as each triangle is drawn
for( i in ID[2:length(ID)]){
	print(i)
	lines(data[data[,3] == i, 1:2], col = i)
}



# here each command is repeated outside of the loop (if i want to draw only one of the triangles)
# it should give the same picture
plot(data[data[,3] == 1, 1:2], type = "l")
lines(data[data[,3] == 2, 1:2], col = 2)
lines(data[data[,3] == 3, 1:2], col = 3)




