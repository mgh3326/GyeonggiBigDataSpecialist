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

par(mar=c(4,4,1,1))
plot(hf.son$Father, hf.son$Height, xlab="아버지의 키", ylab="아들의 키")
abline(v=mean(hf.son$Father), col=2, lty=2)
abline(h=mean(hf.son$Height), col=2, lty=2)

