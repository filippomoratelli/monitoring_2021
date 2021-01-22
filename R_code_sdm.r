# R_code_sdm.r

install.packages("sdm")
library(sdm)
library(raster)
library(rgdal)

# import species data
file <- system.file("external/species.shp", package="sdm")
species <- shapefile(file)

species
plot(species)
plot(species, pch=17) # changing points from crosses to triangles

# presence and absence as 0/1
species$Occurrence
plot(species[species$Occurrence == 1,], col='blue', pch=17)
points(species[species$Occurrence == 0,], col='red', pch=17)

# predictors
path <- system.file("external", package="sdm")
lst <- list.files(path=path, pattern='asc$', full.names=T)
lst

preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

# plot predictors and distribution together
plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl, main='precipitation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$vegetation, col=cl, main='vegetation')
points(species[species$Occurrence == 1,], pch=17)

# model
datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=17)

# stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
