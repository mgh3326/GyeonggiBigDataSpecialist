x <- c(0, 1, 2)
px <- c(1 / 4, 1 / 2, 1 / 4)
Ex <- sum(x * px) # 평균
Var <- sum(x ^ 2 * px) - Ex ^ 2 # 분산

### 이항 분포 ##
n <- 6
p <- 1 / 3
x <- 0:n
px <- dbinom(x = x, size = n, prob = p)
px
plot(x, px, type = 's')

##누적 분포함수 ##
pbinom(q = 2, size = n, prob = p)
qbinom(p = 0.5, size = n, prob = p)
rbinom(n = 3, size = n, prob = p)
? rbinom
b1 <- dbinom(0:5, size = 5, prob = 1 / 3)
b2 <- dbinom(0:15, size = 15, prob = 1 / 3)
b3 <- dbinom(0:30, size = 30, prob = 1 / 3)

plot(b1,
     xlim = c(0, 30),
     col = 'red',
     type = 'l')
lines(b2, col = 'blue')
lines(b3, col = 'green')
mu <- 170
sigma <- 6
ll <- mu - 3 * sigma
up <- mu + 3 * sigma

x <- seq(ll, up, by = 0.01)
nd <- dnorm(x, mean = 170, sd = sigma)
plot(x, nd, type = "l")
? norm
1 - pnorm(q = 170, mean = mu, sd = sigma)
qnorm(p = 0.25, mean = mu, sd = sigma)
rnorm(n = 4, mean = mu, sd = sigma)
runif(n = 4, min = -1, max = 1)

options(digits = 3)
set.seed(1234)

p0.05 <- qnorm(0.05, mean = 0, sd = 1)
p0.025 <- qnorm(0.025, mean = 0, sd = 1)
p0.05
p0.025
###4장 반복문
r.n = rnorm(10)
sum_ini <- 0
for (i in r.n) {
  sum_ini = sum_ini + i
}
sum_ini
m <- matrix(1:12, ncol = 3)
m
m <- matrix(1:9, 9, ncol = 9)
m
for (dan in 2:3) {
  for (times in 1:9) {
    cat (dan, "X", times, "=", dan * times, '\n')
  }
}
m10 <- rep(NA, 1000)
m40 <- rep(NA, 1000)
for (i in 1:1000)
{
  m10[i] <- mean(rnorm(10))
  m40[i] <- mean(rnorm(40))
}
options(digits = 4)
cat("평균", mean(m10), " 표준편차:", sd(m10))
cat("평균", mean(m40), " 표준편차:", sd(m40))

par(mfrow = c(1, 2))
hist(m10, xlim = c(-1.5, 1.5))
hist(m40, xlim = c(-1.5, 1.5))

n <- 1000
r.1.mean <- rep(NA, n)
r.2.mean <- rep(NA, n)

for (i in 1:1000)
{
  r.1.mean[i] <- mean(rnorm(4, mean = 3, sd = 1))
  r.2.mean[i] <- mean(rnorm(4, mean = 170, sd = 6))
}
# r.1.mean
cat("평균", mean(r.1.mean), " 표준편차:", sd(r.1.mean))
cat("평균", mean(r.2.mean), " 표준편차:", sd(r.2.mean))

hist(
  r.1.mean,
  freq = F,
  xlab = "표본평균",
  ylab = "밀도",
  col = "orange",
  border = "red"
)
x1 <- seq(min(r.1.mean), max(r.1.mean), length = 1000)
y1 <- dnorm(x = x1,
            mean = 3,
            sd = 1 / sqrt(4))
lines(x1,
      y1,
      lty = 2,
      lwd = 2,
      col = "blue")

hist(
  r.2.mean,
  freq = F,
  xlab = "표본평균",
  ylab = "밀도",
  col = "orange",
  border = "red"
)
x1 <- seq(min(r.2.mean), max(r.2.mean), length = 1000)
y1 <- dnorm(x = x1,
            mean = 170,
            sd = 6 / sqrt(4))
lines(x1,
      y1,
      lty = 2,
      lwd = 2,
      col = "blue")
## 표본 평균의 분포
set.seed(10)
t <- 10
p <- 0.1
x <- 0:10
n <- 1000
b.2.mean <- rep(NA, n)
b.4.mean <- rep(NA, n)
b.32.mean <- rep(NA, n)
for (i in 1:n) {
  b.2.mean[i] <- mean(rbinom(2, size = t, prob = p))
  b.4.mean[i] <- mean(rbinom(4, size = t, prob = p))
  b.32.mean[i] <- mean(rbinom(32, size = t, prob = p))
  
}
mean(b.2.mean)
sd(b.2.mean)
mean(b.4.mean)
sd(b.4.mean)
mean(b.32.mean)
sd(b.32.mean)
par(mfrow = c(1, 1))
hist(b.2.mean, prob = T, xlim = c(0, 4))
x1 <- seq(min(b.2.mean), max(b.2.mean), length = 1000)
y1 <- dnorm(x = x1,
            mean = 1,
            sd = 0.9487 / sqrt(32))
lines(x1, y1)

cor1 = c(234, 234, 234, 233, 233, 233, 233, 231, 232, 231)
cor2 = c(146.3,
         146.4,
         144.1,
         146.7,
         145.2,
         144.1,
         143.3,
         147.3,
         146.7,
         147.3)
var.p<-function(x)
{
  n <- length(x)
  m <- mean(x)
  num <- sum((x - m) ^ 2)
  denom <- n
  var <- num / denom
  return (var)
}
var.p(cor1)
var.p(cor2)
