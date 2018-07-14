# 그림 7-6
set.seed(2)
grp1 <- rnorm(20, mean=-1)
grp2 <- rnorm(20, mean=0.5)
grp3 <- rnorm(20, mean=1)

d <- data.frame(grp=rep(1:3, each=20), val=c(grp1, grp2, grp3))
par(mar=c(1, 1, 1, 1))

plot(val~grp, data=d, pch=20, col="red", xlim=c(1, 3.5), ylim=c(-4.2, 4), axes=F, xlab="", ylab="")

text(1.2, -4, "처리 1")
text(2.2, -3, "처리 2")
text(3.2, -2, "처리 3")

abline(h=mean(d$val), lwd=2, col="red")
arrows(1.5, 1.9, 1.5, mean(d$val), length=0.1)
text(1.5, 2.2, expression(bar(y[..]) ), cex=1.5)

lines(c(1, 1), c(-4, 2), lty=2, col="blue")
lines(c(2, 2), c(-2.5, 3.5), lty=2, col="blue")
lines(c(3, 3), c(-2, 4), lty=2, col="blue")

y1 <- seq(-4, 2, by=0.01)
x1 <- 1+dnorm(y1, mean=-1)
lines(x1, y1, lty=3, lwd=1.5)
lines(c(1, max(x1)), c(-1, -1), lty=2)
arrows(1.5, -3, 1.3, -2, length=0.05)
text(1.5, -3.2, expression(N(mu[1], sigma^2) ))

y2 <- seq(-2.5, 3.5, by=0.01)
x2 <- 2+dnorm(y2, mean=0.5)
lines(x2, y2, lty=3, lwd=1.5)
lines(c(2, max(x2)), c(0.5, 0.5), lty=2)
arrows(2.4, 1.8, 2.3, 1.3, length=0.05)
text(2.5, 2.2, expression(N(mu[2], sigma^2) ))

y3 <- seq(-2, 4, by=0.01)
x3 <- 3+dnorm(y3, mean=1)
lines(x3, y3, lty=3, lwd=1.5)
lines(c(3, max(x3)), c(1, 1), lty=2)
arrows(3.4, 2.8, 3.3, 2, length=0.05)
text(3.4, 3.2, expression(N(mu[3], sigma^2) ))

