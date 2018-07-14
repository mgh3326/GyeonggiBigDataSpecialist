# 그림 4-6
t <- 10; p <- 0.1; x <- 0:10    # 세미콜론(;) 을 이용하여 한 줄에 여러 명령을 실행할 수 있습니다.
b.p <- dbinom(x, size=t, prob=p)
barplot(b.p, names=x, main="n=10, p=0.1인 이항분포")

# 예제 4-3
set.seed(9)
t <- 10
p <- 0.1
x <- 0:10
n <- 1000
b.2.mean <- rep(NA, n)
b.4.mean <- rep(NA, n)
b.32.mean <- rep(NA, n)

for(i in 1:n) {
  b.2.mean[i] <- mean( rbinom(2, size=t, prob=p) )
  b.4.mean[i] <- mean( rbinom(4, size=t, prob=p) )
  b.32.mean[i] <- mean( rbinom(32, size=t, prob=p) )
}

options(digits=4)
c(mean(b.2.mean), sd(b.2.mean))
c(mean(b.4.mean), sd(b.4.mean))
c(mean(b.32.mean), sd(b.32.mean))

hist(b.2.mean, prob=T, xlim=c(0, 4), main="표본 크기 : 2", ylab="", xlab="", col="orange", border="red")
x1 <- seq(min(b.2.mean), max(b.2.mean), length=1000)
y1 <- dnorm( x=x1, mean=1, sd=sqrt(0.9)/sqrt(2) )
lines(x1, y1, lty=2, lwd=2, col="blue")

hist(b.4.mean, prob=T, xlim=c(0, 4), ylim=c(0, 1.2), main="표본 크기 : 4", ylab="", xlab="", col="orange", border="red")
x2 <- seq(min(b.4.mean), max(b.4.mean), length=1000)
y2 <- dnorm( x=x2, mean=1, sd=sqrt(0.9)/sqrt(8) )
lines(x2, y2, lty=2, lwd=2, col="blue")

hist(b.32.mean, prob=T, xlim=c(0, 4), main="표본 크기 : 32", ylab="", xlab="", col="orange", border="red")
x3 <- seq(min(b.32.mean), max(b.32.mean), length=1000)
y3 <- dnorm( x=x3, mean=1, sd=sqrt(0.9)/sqrt(32) )
lines(x3, y3, lty=2, lwd=2, col="blue")