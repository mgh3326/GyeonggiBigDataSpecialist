ad <- read.csv("./data/age.data.csv", header=T)

ad$score <- ifelse(ad$score==99, NA, ad$score)
ad$scale <- factor(ad$scale)
ad$sex <- factor(ad$sex)

y1 <- ad$age[ad$scale=="1"]
y2 <- ad$age[ad$scale=="2"]
y3 <- ad$age[ad$scale=="3"]

y1.mean <- mean( y1 )
y2.mean <- mean( y2 )
y3.mean <- mean( y3 )

sse.1 <- sum( (y1 - y1.mean)^2 )
sse.2 <- sum( (y2 - y2.mean)^2 )
sse.3 <- sum( (y3 - y3.mean)^2 )

(sse <- sse.1 + sse.2 + sse.3)
(dfe <- (length(y1)-1) + (length(y2)-1) + (length(y3)-1))

y <- mean(ad$age)

sst.1 <- length(y1) * sum((y1.mean - y)^2)
sst.2 <- length(y2) * sum((y2.mean - y)^2)
sst.3 <- length(y3) * sum((y3.mean - y)^2)

(sst <- sst.1 + sst.2 + sst.3)
(dft <- length( levels( ad$scale ) ) - 1)

( tsq <- sum( (ad$age - y)^2 ) )
( ss <- sst + sse )

mst <- sst / dft
mse <- sse / dfe
(f.t <- mst / mse)

alpha <- 0.05
(tol <- qf(1-alpha, 2, 147))

(p.value <- 1 - pf(f.t, 2, 147))
# 그림 7-7
x <- seq(0, 4, by=0.01)
yf <- df(x, 2, 147)
par(mar=c(2, 1, 1, 1))
plot(x, yf, type="l", ylim=c(-0.1, 1), xlab="", ylab="", axes=F)
abline(h=0)
tol.r <- round(tol, 2)
polygon(c(tol.r, x[x>=tol.r], 4), c(0, yf[x>=tol.r], 0), col="red")
arrows(tol, 0.3, tol, 0.08, length=0.1)
text(tol, 0.32, paste("P(F(2, 147) > ", round(tol, 3),")=0.05", sep=""), cex=0.8)
lines(c(f.t, f.t), c(0,df(f.t, 2, 147)), lty=2)
arrows(f.t, -0.05, f.t, 0, length=0.05)
text(f.t, -0.1, paste("F(2, 147)=", round(f.t, 3),sep=""), cex=0.8)

ow <- lm(age~scale, data=ad)
anova(ow)

oneway.test(age~scale, data=ad, var.equal=TRUE)
