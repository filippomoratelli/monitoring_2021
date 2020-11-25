# R code for plotting the relationship among ecological variables

# to install new packages
install.packages("sp")
library(sp)

# to recall datasets
data(meuse)

# to open dataset
meuse

# to view data clearer (with capital letter, but not working on Mac)
View(meuse)

# to see top of dataset
head(meuse)

# to extract mean of all variables
summary(meuse)

# plot zinc (y) against cadmium (x)
#first way: using $
plot(meuse$cadmium, meuse$zinc)

# second way: attach dataset to R
attach(meuse)
plot(cadmium, zinc)
plot(cadmium, lead)

# scatterplot matrices (all possible graphs)
pairs(meuse)


# lecture 2

# recall the sp package and meuse dataset
library(sp)
data(meuse)

# pairs with soil variables (Cd, Cu, Pb, Zn = 3, 4, 5, 6 columns)
# from (,) column 3 to (:) column 6, using []
pairs(meuse[,3:6])

# use the names of the columns instead (if we use a different system)
# tilde = option + 5 ~
pairs(~ cadmium + copper + lead + zinc, data=meuse)

# change color (using "x") COL
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red")
# change symbol to filled triangles (no "x") PCH
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17)
# increase size of triangles CEX
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red", pch=17, cex=3)
