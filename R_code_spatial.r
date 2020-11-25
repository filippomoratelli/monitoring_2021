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
