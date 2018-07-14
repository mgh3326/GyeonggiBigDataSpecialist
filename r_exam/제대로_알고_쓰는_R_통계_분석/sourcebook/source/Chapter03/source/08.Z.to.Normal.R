options(digits = 4)
mu <- 0
sigma <- 1

(p0.05 <- qnorm(0.05, mean=mu, sd=sigma))
(p0.025 <- qnorm(0.025, mean=mu, sd=sigma))

pnorm(1.645) - pnorm(-1.645)
pnorm(1.96) - pnorm(-1.96) 