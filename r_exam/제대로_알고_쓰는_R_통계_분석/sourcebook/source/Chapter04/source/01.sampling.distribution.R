m10 <- rep(NA, 1000)
m40 <- rep(NA, 1000)
set.seed(9)
for( i in 1:1000) {
  m10[i] <- mean(rnorm(10))
  m40[i] <- mean(rnorm(40))
}

options(digits=4)
c(mean(m10), sd(m10))
c(mean(m40), sd(m40))

hist(m10, xlim=c(-1.5, 1.5), main="", xlab="x", ylab="", col="cyan", border="blue")
hist(m40, xlim=c(-1.5, 1.5), main="", xlab="x", ylab="", col="cyan", border="blue")