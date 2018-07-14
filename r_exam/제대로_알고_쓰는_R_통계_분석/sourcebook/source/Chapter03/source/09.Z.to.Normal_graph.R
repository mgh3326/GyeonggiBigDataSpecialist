z <- seq(-3, 3, by=0.001)
z.p <- dnorm(z)

# 그림 3-16
plot(z, z.p, axes=F, type="l", main="표준정규분포 (90%)", ylab="", ylim=c(-0.04, 0.4))
axis(1)
lines(c(-3, 3), c(0, 0))
points(-1.645, -0.02, pch=17, col="red")
text(-1.645, -0.035, "-1.645", col="red")
points(1.645, -0.02, pch=17, col="red")
text(1.645, -0.035, "1.645", col="red")

s <- seq(-1.645, 1.645, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.645, s, 1.645)
s.z <- c(0, s.z, 0)

polygon(s, s.z, density=10, col="red")


# 그림 3-17
plot(z, z.p, axes=F, type="l", main="표준정규분포 (95%)", ylab="", ylim=c(-0.04, 0.4))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.96, -0.02, pch=17, col="red")
text(-1.96, -0.035, "-1.96", col="red")
points(1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col="red")

s <- seq(-1.96, 1.96, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)
