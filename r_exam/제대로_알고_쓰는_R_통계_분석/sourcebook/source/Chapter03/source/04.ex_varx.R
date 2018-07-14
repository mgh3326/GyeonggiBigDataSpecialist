n <- 6
p <- 1/3
x <- 0:n
px <- dbinom(x, size=n, prob=p)
(ex <- sum( x * px ))
ex2 <- sum( x^2 * px )
(varx <- ex2 - ex^2)