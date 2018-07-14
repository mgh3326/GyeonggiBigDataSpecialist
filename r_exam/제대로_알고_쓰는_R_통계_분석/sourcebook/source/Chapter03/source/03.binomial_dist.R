n <- 6
p <- 1/3
x <- 0:n

(dbinom(2, size=n, prob=p))
(dbinom(4, size=n, prob=p))
(px <- dbinom(x, size=n, prob=p))
plot(x, px, type="s", xlab="성공횟수(x)", ylab="확률(P[X=x])", main="B(6, 1/3)", lwd=2, col="red")

(pbinom(2, size=n, prob=p))
(pbinom(4, size=n, prob=p))
(pbinom(4, size=n, prob=p) - pbinom(2, size=n, prob=p))

(qbinom(0.1, size=n, prob=p))
(qbinom(0.5, size=n, prob=p))

(rbinom(10, size=n, prob=p))