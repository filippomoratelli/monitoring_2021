# Point pattern analysis

install.packages("spatstat")
library(spatstat)

covid <- read.table("covid_agg.csv", header=TRUE)
covid

# density of the covid data
# planar point pattern in spatstat
attach(covid)
# using x, y, ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))
density_map <- density(covid_planar)
plot(density_map)
