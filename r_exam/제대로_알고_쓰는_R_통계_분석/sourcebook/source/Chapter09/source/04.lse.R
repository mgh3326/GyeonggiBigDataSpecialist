hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", header=T, stringsAsFactors = FALSE)
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
hf.son <- subset(hf, Gender=="M")
hf.son <- hf.son[c("Father", "Height")]

mean.x <- mean(hf.son$Father)
mean.y <- mean(hf.son$Height)

sxy <- sum((hf.son$Father - mean.x)*(hf.son$Height - mean.y))
sxx <- sum((hf.son$Father - mean.x)^2)

( b1 <- sxy / sxx )
( b0 <- mean.y - b1 * mean.x )


# lm() 함수 이용 
lm(Height ~ Father, data=hf.son)