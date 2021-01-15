# recall and install packages
install.packages("rasterVis")
library(rasterVis)
library(rasterdiv)
library(raster)

# add and plot data for NDVI from Copernicus (using rasterdiv data)
data(copNDVI)
plot(copNDVI)

# remove blue and brown data (oceans and desert/ice caps) and plot again
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# add graphs
levelplot(copNDVI)

# change colors (yellow position)
clymin <- colorRampPalette(c('yellow', 'red', 'blue'))(100)#
plot(copNDVI, col=clymin)
clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)#
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue', 'red', 'yellow'))(100)#
plot(copNDVI, col=clymax)

par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red', 'yellow', 'blue'))(100)#
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue', 'red', 'yellow'))(100)#
plot(copNDVI, col=clymax)

# zooming and cropping the map
ext <- c(0,20,35,55)
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
