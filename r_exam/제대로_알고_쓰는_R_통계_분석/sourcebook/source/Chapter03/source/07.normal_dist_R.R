options(digits=3)
mu <- 170
sigma <- 6
ll <- mu - 3*sigma
ul <- mu + 3*sigma

x <- seq(ll, ul, by=0.01)
nd <- dnorm(x, mean=mu, sd=sigma)
plot(x, nd, type="l", xlab="x", ylab="P(X=x)", lwd=2, col="red")

pnorm(mu, mean=mu, sd=sigma)
pnorm(158, mean=mu, sd=sigma)
pnorm(180, mean=mu, sd=sigma) - pnorm(160, mean=mu, sd=sigma)

qnorm(0.25, mean=mu, sd=sigma)
qnorm(0.5, mean=mu, sd=sigma)
qnorm(0.75, mean=mu, sd=sigma)

options(digits=5)
set.seed(5)
smp <- rnorm(400, mean=mu, sd=sigma)
c(mean(smp), sd(smp))
hist(smp, prob=T, main="N(170, 6^2)으로부터 추출한 표본의 분포(n=400)", xlab="", ylab="", col="white", border="black")
lines(x, nd, lty=2, lwd=2, col="red")