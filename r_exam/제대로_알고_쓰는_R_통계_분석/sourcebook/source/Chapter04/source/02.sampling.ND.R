set.seed(9)
n <- 1000
r.1.mean = rep(NA, n)
r.2.mean = rep(NA, n)
for (i in 1:n ) {
  r.1.mean[i] = mean( rnorm(4, mean=3, sd=1) )
  r.2.mean[i] = mean( rnorm(4, mean=170, sd=6) )
}

options(digits=4)
c(mean(r.1.mean), sd(r.1.mean))
c(mean(r.2.mean), sd(r.2.mean))

hist(r.1.mean, prob=TRUE, xlab="표본평균", ylab="밀도", main="", col="orange", border="red")
x1 <- seq(min(r.1.mean), max(r.1.mean), length=1000)
y1 <- dnorm(x=x1, mean=3, sd=(1/sqrt(4)))
lines(x1, y1, lty=2, lwd=2, col="blue")

hist(r.2.mean, prob=TRUE, xlab="표본평균", ylab="밀도", main="", col="orange", border="red")
x2 <- seq(min(r.2.mean), max(r.2.mean), length=1000)
y2 <- dnorm( x=x2, mean=170, sd=(6/sqrt(4)) )
lines(x2, y2, lty=2, lwd=2, col="blue")