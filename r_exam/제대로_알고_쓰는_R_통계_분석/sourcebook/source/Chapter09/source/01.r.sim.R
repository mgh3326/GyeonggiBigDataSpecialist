# 그림 9-1
set.seed(9)
rvnorm <- function(r) {
  x <- rnorm(50, 0, 1)
  y <- rnorm(50, r*x, sqrt(1-r^2))
  return(cbind(x,y))
}

par(mfrow=c(1, 3), mar=c(2, 2, 2, 1), oma=c(0,0,0,0))

r1 <- rvnorm(0.8)
plot(r1, main="r=0.8")
abline(lm(r1[,2] ~ r1[,1]), col="red")

plot(rvnorm(0), main="r=0")
abline(h=0, col="red")

r3 <- rvnorm(-0.8)
plot(r3, main="r=0.8")
abline(lm(r3[,2] ~ r3[,1]), col="red")