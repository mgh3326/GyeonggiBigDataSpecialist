ad <- read.csv("./data/age.data.csv", header=T)
str( ad )
head( ad )
tail( ad )
summary(ad)

ad$score <- ifelse(ad$score==99, NA, ad$score)
summary(ad)

ad2 <- read.csv("./data/age.data.csv", header=T, na.strings = c("99"))
summary(ad2)

mean(ad$score)
mean(ad$score, na.rm=TRUE)

is.na( c(1, NA, 3, NA, 5) )

nonna.sum <- sum( ad$score[!is.na(ad$score)] )
nonna.length <- length( ad$score[!is.na(ad$score)] )
nonna.sum / nonna.length

ad$scale <- factor(ad$scale)
ad$sex <- factor(ad$sex)
str(ad)
summary(ad)

length(ad$age[ad$scale=="1"])
mean(ad$age[ad$scale=="1"])
sd(ad$age[ad$scale=="1"])

# package "doBy" 이용
install.packages("doBy")
library(doBy)
summaryBy(age~scale, data=ad, FUN=c(length))
summaryBy(age~scale, data=ad, FUN=c(mean, sd), na.rm=TRUE)