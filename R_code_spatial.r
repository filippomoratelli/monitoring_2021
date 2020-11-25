R spatial

library(sp)

data(meuse)
head(meuse)

# plot coordinates
coordinates(meuse) = ~x+y
plot(meuse)

# spplot is used to plot elements like zinc, lead etc. spread in space
spplot(meuse, "zinc", main="Concentration of zinc")
spplot(meuse, "copper", main="Concentration of copper")
# different colors = different amounts

# plot two variables
spplot(meuse, c("copper","zinc"))

# instead of colors use bubbles with different dimensions
bubble(meuse, "zinc")

bubble(meuse, "lead")
bubble(meuse, "lead", col="red")


# ggplot 2 
install.packages("ggplot2")
library(ggplot2)

# ecological dataframe
# biofuels
# array of values: c
biofuels <- c(120, 200, 350, 570, 750)
biofuels
# oxydative enzimes
oxydative <- c(1200, 1300, 21000, 34000, 50000)
oxydative

# create a dataframe (table)
d <- data.frame(biofuels, oxydative)
d
# or just
data.frame(biofuels, oxydative)

# plot using ggplot
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point()
# aes stands for aestethics = data (x,y)
# geom_point is to create a graphic visualization of the values
# change size and colors of the points
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")

# line instead of points
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line()

# both points and a line
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")  +  geom_line() 

# polygons
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()


#### import data from an external source

# it should be something like setwd("/Desktop/UniBo/Monitoring/lab/")
# instead do command + D and choose folder
# import spreadsheet
covid <- read.table("covid_agg.csv", header=TRUE)
# to see data
covid
