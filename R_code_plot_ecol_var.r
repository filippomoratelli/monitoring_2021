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
