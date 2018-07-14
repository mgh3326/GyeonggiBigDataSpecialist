hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", header=T, stringsAsFactors = FALSE)
str( hf )

str( hf$Gender )
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
str( hf$Gender )
str( hf )

hf.son <- subset(hf, Gender=="M")
str( hf.son )

hf.son <- hf.son[c("Father", "Height")]
str( hf.son )

summary(hf.son)

plot(hf.son$Father, hf.son$Height, xlab="", ylab="", main="Height of Father and Son")
abline(v=mean(hf.son$Father), col=2, lty=2)
abline(h=mean(hf.son$Height), col=2, lty=2)

