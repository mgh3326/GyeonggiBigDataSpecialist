# c + X
x.1 <- seq(-3, 3, by=0.01)
y.1 <- dnorm(x.1)

x.2 <- x.1 + 1
y.2 <- y.1

jpeg("./output/05.cpx.jpg", width=800, height=400, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.1, y.1, xlim=c(-3, 4), type="l", axes=F)
lines(c(-3, 4), c(0, 0))
lines(x.2, y.2, lty=2, col="red")
abline(v=0)
abline(v=1, lty=2, col="red")

arrows(0.1, 0.1, 0.9, 0.1, length=0.2)
dev.off()

# cX
x.1 <- seq(-2, 4, by=0.01)
y.1 <- dnorm(x.1, mean=1, sd=1)

x.2 <- x.1 * 2
y.2 <- dnorm(x.2, mean=2, sd=2)

jpeg("./output/06.ctx.jpg", width=800, height=400, quality=100)
par(mar=c(1, 0, 1, 0))
plot(x.1, y.1, xlim=c(-4, 8), type="l", axes=F)
lines(c(-4, 8), c(0, 0))
lines(x.2, y.2, lty=2, col="red")
abline(v=1)
abline(v=2, lty=2, col="red")

arrows(1.1, 0.1, 1.9, 0.1, length=0.2)
dev.off()