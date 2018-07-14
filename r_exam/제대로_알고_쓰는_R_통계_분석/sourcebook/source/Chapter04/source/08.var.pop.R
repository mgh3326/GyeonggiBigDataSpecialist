options(digits=5)
cor <- c(0.4196, 0.4172, 0.4237, 0.4182, 0.4324, 0.4365, 0.4354, 0.4156, 0.4172, 0.4414)

m <- mean(cor)
dev <- cor - m
num <- sum( dev^2 )
denom <- length(cor)
denom2 <- length(cor) - 1

(var.p <- num / denom)
(var.s <- num / denom2)
var(cor)