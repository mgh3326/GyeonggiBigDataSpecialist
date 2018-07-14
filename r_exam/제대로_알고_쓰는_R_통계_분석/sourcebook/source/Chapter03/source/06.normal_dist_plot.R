#그림 3.12
x <- seq(-4, 4, by=0.01)
p <- dnorm(x, mean=0, sd=1)
#jpeg("./output/3.12.jpg", width=600, height=400, quality=100)
#par(mar=c(4,4,0,0))
plot(x, p, type="l",  xlab="x", ylab="P(X=x)", lwd=2, col="red")
#dev.off()

# 그림 3.13
set.seed(1)
x <- rnorm(10000, mean=170, sd=4)
hist(x, breaks=seq(150, 190, 1), right=F, freq=F)





x <- seq(-3, 3, by=0.01)
p <- dnorm(x, mean=0, sd=1)
plot(x, p, type="l")

x.1 <- seq(-3, 0.5, length=500)
p.1 <- dnorm(x.1, mean=0, sd=1)
x.2 <- rep(x.1, each=2)
p.2 <- rep(NA, 1000)
for(i in 1:1000) {
  if(i %% 2 == 0) {
    p.2[i] <- 0   
  } else {
    p.2[i] <- p.1[((i-1)/2)+1]
  }
}

plot(x, p, xlab="z", type="l")
lines(x.2, p.2, col="red")

