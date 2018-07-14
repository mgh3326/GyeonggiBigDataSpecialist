library(prob)
n <- 3
smps.all <- rolldie(n)
str( smps.all )
head( smps.all, n=3 )

is.even <- function(x) return(!x%%2)
var.p <- function(x) {
  return( sum((x-mean(x))^2 / length(x))  )
}
p.even <- function(x, s.size=3) {
  return( sum(is.even(x)) / s.size )
}

phat <- apply(smps.all, 1, p.even)

mean(phat)
( p.p <- 0.5 )
var.p(phat)
( p.p*(1-p.p)/3 )
sqrt(var.p(phat))