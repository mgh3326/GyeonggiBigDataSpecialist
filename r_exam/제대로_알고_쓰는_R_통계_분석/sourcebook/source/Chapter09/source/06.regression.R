hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", header=T, stringsAsFactors = FALSE)
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
hf.son <- subset(hf, Gender=="M")
hf.son <- hf.son[c("Father", "Height")]

out <- lm(Height ~ Father, data=hf.son)
anova(out)

summary(out)

no <- par(no.readonly = TRUE)
par(mfrow=c(2,2))
plot(out)
par(no)





# 그림 9-5
no <- par(no.readonly = TRUE)
par(mar=c(2,2,2,1))
plot(Height~Father, data=hf.son, main="", xlab="아버지의 키(인치)", ylab="아들의 키(인치)", ylim=c(65, 75))
abline(out, lwd=1.5)
ci <- predict(out, interval="confidence")
prd <- predict(out, interval="predict")
lines(hf.son$Father, ci[,2], lty=3, lwd=1.5, col="red")
lines(hf.son$Father, ci[,3], lty=3, lwd=1.5, col="red")
par(no)

