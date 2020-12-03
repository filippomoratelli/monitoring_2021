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

# change color palette
cl <- colorRampPalette(c('yellow','orange','red'))(100) 
plot(density_map, col = cl)
points(covid_planar)

# more colors
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) 
plot(density_map, col = cl)
points(covid_planar)

# putting countries on top of the map using another package from OSGeo
install.packages("rgdal")
library(rgadl)

# download coastlines
# download the files (three types) and put them in the work directory
coastlines <- readOGR("ne_10m_coastline.shp")

# add coastlines to the map
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)

# change points (add PCH to points)
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100)
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
