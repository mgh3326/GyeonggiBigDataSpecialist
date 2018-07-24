install.packages("flexclust")
library(flexclust)
data(nutrient, package = "flexclust")
head(nutrient)
d <- dist(nutrient)
as.matrix(d)[1:4, 1:4]
