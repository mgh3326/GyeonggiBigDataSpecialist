data <- read.csv("./data/01.anorexia.csv", header=T)
str( data )

n <- length(data$Prior - data$Post)
m <- mean( data$Prior - data$Post )
s <- sd (data$Prior - data$Post)
( t.t <- m/(s / sqrt(n)) )

t.test(data$Prior, data$Post, paired=T, alternative="less")

alpha <- 0.05
qt(alpha, df=16)

pt(t.t, df=16)

