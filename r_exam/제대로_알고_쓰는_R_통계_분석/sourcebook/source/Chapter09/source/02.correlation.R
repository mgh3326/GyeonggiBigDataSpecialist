hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", header=T, stringsAsFactors = FALSE)
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
hf.son <- subset(hf, Gender=="M")
hf.son <- hf.son[c("Father", "Height")]

f.mean <- mean(hf.son$Father)
s.mean <- mean(hf.son$Height)
cov.num <- sum( (hf.son$Father-f.mean) * (hf.son$Height - s.mean) )
(cov.xy <- cov.num / (nrow(hf.son) - 1))
cov(hf.son$Father, hf.son$Height) 

(r.xy <- cov.xy / (sd(hf.son$Father) * sd(hf.son$Height)))
cor(hf.son$Father, hf.son$Height)
# 그림 9-2
par(mfrow=c(1, 1), mar=c(4, 4, 1, 1))
plot(Height~Father, pch=16, data=hf.son, xlab="아버지의 키(인치)", ylab="아들의 키(인치)")
abline(lm(Height~Father, data=hf.son), col="red", lwd=2)
