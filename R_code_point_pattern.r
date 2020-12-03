# Point pattern analysis

install.packages("spatstat")
library(spatstat)

# lab folder
# cmd + D then select lab folder

# add file from lab folder
covid <- read.table("covid_agg.csv", header=TRUE)
covid
head(covid)

# density of the covid data
# planar point pattern in spatstat
attach(covid)
# using x, y, ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)

points(covid_planar)

cl <- colorRampPalette(c('yellow','orange','red'))(100) # 
plot(density_map, col = cl)
points(covid_planar)
