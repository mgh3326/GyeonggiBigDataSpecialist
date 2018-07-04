mean.seq <- function(x) {
  n <- length(x)
  sum <- 0
  n2 <- 0
  
  for (i in 1:n) {
    newx <- i * x[i]
    sum <- sum + newx
    n2 <- n2 + i
  }
  return(sum / n2)
}

set.seed(1234)
y1 <- rep(NA, 1000)
y2 <- rep(NA, 1000)

for (i in 1:1000) {
  smp <- rnorm(3)
  y1[i] <- mean(smp)
  y2[i] <- mean.seq(smp)
}

n1 <- length(y1[(y1 > -0.1) & (y1 < 0.1)])
n2 <- length(y2[(y2 > -0.1) & (y2 < 0.1)])

data.frame(mean = mean(y1),
           var = var(y1),
           n = n1)
data.frame(mean = mean(y2),
           var = var(y2),
           n = n2)
