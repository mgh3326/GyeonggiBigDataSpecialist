install.packages("PairedData")
library(PairedData)
data(Anorexia)
Anorexia
write.csv(Anorexia, "./data/01.anorexia.csv", row.names=FALSE)
