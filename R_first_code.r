# comment

# array
primates <- c(3, 5, 9, 15, 40)
primates

# new set:
crabs <- c(100, 70, 30, 10, 5)
crabs

# first plot in R
plot(primates, crabs)

plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch=19)

plot(primates, crabs, col="red", pch=19, cex=2)

plot(primates, crabs, col="red", pch=19, cex=2, main="My first graph in R")

# dataframe
ecoset <- data.frame(primates, crabs)
ecoset

# ecological numbers
# mean numbers of individual per site
(3+5+9+15+40)/5

#summary of dataframe
summary(ecoset)

