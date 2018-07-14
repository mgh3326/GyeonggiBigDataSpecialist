x <- seq(-3, 3, by=0.01)
y <- dnorm(x)

plot(x, y, type="l", xlim=c(-3, 3.5), ylim=c(0, 0.5), axes=FALSE)
axis(1)
lines(c(0, 0), c(0, max(y)), lty=3)
text(-0.1, max(y)+0.05, "① 평균 0, 표준편차 1")
arrows(-0.1, max(y)+0.03, 0, max(y), length=0.1)


y2 <- dnorm(x+0.5, mean=0.5)
lines(x+0.5, y2, col="red")
lines(c(0.5, 0.5), c(0, max(y2)), lty=3)
text(2, max(y2)+0.05, "② 평균 0.5, 표준편차 1")
arrows(2, max(y2)+0.03, 1, dnorm(1, mean=0.5), length=0.1)


y3 <- dnorm(x-1, mean=-1, sd=1.5)
lines(x-1, y3, col="blue")
lines(c(-1, -1), c(0, max(y3)), lty=3)
text(-2, max(y3)+0.05, "③ 평균 -1, 표준편차 1.5")
arrows(-2, max(y3)+0.03, -1.5, dnorm(-1.5, mean=-1, sd=1.5), length=0.1)