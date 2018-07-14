hf <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", header=T, stringsAsFactors = FALSE)
hf$Gender <- factor(hf$Gender, levels=c("M", "F"))
hf.son <- subset(hf, Gender=="M")
hf.son <- hf.son[c("Father", "Height")]

out <- lm(Height ~ Father, data=hf.son)
out2 <- lm(dist ~ speed, data=cars)
# 그림 9-6
no <- par(no.readonly = TRUE)
par(mfrow=c(1, 2), mar=c(2, 2, 2, 3))
plot( hf.son$Father, residuals(out), xlab="residuals", ylab="")
abline(h=0, col="red", lty=2)
plot( cars$speed, residuals(out2), xlab="residuals", ylab="" )
abline(h=0, col="red", lty=2)
par( no )
# 그림 9-7
dev.off()
no <- par(no.readonly = TRUE)
par(mfrow=c(1, 2), mar=c(2, 2, 2, 3))
qqnorm(residuals(out), main="")
qqline(residuals(out), lty=2, col="red")
qqnorm(residuals(out2), main="")
qqline(residuals(out2), lty=2, col="red")
par( no )

# 정규성 검정
shapiro.test(residuals(out2))