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

###########

library(raster)
library(RStoolbox)

# change working directory (cmd D) and then name file
defor1 <- brick("defor1_.jpg")

# to see data (under "names" you see names of layers like defor1_.1, .2, ...)
defor1

# plot using RGB
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor1, 2, 1, 3, stretch="Lin")

# same things for the other picture
defor2 <- brick("defor2_.jpg")
defor2
plotRGB(defor2, 2, 1, 3, stretch="Lin")

# plot both
par(mfrow=c(2,1))
plotRGB(defor1, 2, 1, 3, stretch="Lin")
plotRGB(defor2, 2, 1, 3, stretch="Lin")

dev.off()

# DVI using layers (image name $ layer name, we do NIR layer - red layer)
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi1, col=cl)

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# biomass difference before and after cut
difdvi <- dvi1 - dvi2
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost")

# histogram
hist(difdvi, col="red")

# final par with all plots
par(mfrow=c(3,2))
plotRGB(defor1, 2, 1, 3, stretch="Lin")
plotRGB(defor2, 2, 1, 3, stretch="Lin")
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")
plot(difdvi, col=cldif, main="amount of energy lost")
hist(difdvi, col="red")
