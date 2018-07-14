# 그림 9-4
hf <- read.csv("Galton.csv", header=T, stringsAsFactors = FALSE)
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
hf.son <- subset(hf, Gender=="M")
hf.son <- hf.son[c("Father", "Height")]

out <- lm(Height ~ Father, data=hf.son)

mean.y <- mean(hf.son$Height)

par(mar=c(4, 4, 1, 1))
plot(Height~Father, pch=21, data=hf.son, xlim=c(75, 76), ylim=c(68, 75), xlab="아버지의 키(인치)", ylab="아들의 키(인치)")
abline(h=mean.y, lwd=2)
abline(lm(Height~Father, data=hf.son), lty=3)

lines(c(75.5, 75.5), c(mean.y, out$fitted.values[hf.son$Father==75.5][1]))
lines(c(75.5, 75.5), c(out$fitted.values[hf.son$Father==75.5][1], min(hf.son$Height[hf.son$Father==75.5])), lty=3, col="red", lwd=2)

text(75.8, 70, expression(bar(y)))
arrows(75.8, 69.7, 75.8, 69.3, length=0.08)

text(75.8, 71, expression(hat(y)))
arrows(75.8, 71.3, 75.8, 72, length=0.08)

text(75.6, 70.5, expression(y-bar(y)))
arrows(75.55, mean.y, 75.55, min(hf.son$Height[hf.son$Father==75.5]), angle=90, code=3, length=0.05)


text(75.4, 72.5, expression(y-hat(y)), col="red")
arrows(75.45, out$fitted.values[hf.son$Father==75.5][1], 75.45, min(hf.son$Height[hf.son$Father==75.5]), angle=90, code=3, length=0.05, col="red", lty=3)

text(75.4, 70, expression(hat(y)-bar(y)))
arrows(75.45, out$fitted.values[hf.son$Father==75.5][1], 75.45, mean.y, angle=90, code=3, length=0.05)
