n1 <- 5
n2 <- 10
n3 <- 30
p <- 0.3

x3 <- 1:n3
x2 <- 1:n2
x1 <- 1:n1

b3 <- dbinom(x3, size=n3, prob=p)
b2 <- dbinom(x2, size=n2, prob=p)
b1 <- dbinom(x1, size=n1, prob=p)

# 그림 3.11
#jpeg("./output/3.11.jpg", width=600, height=300, quality=100)
par(mar=c(4,4,0,0))
plot(x3, b3, type="l", ylim=c(0, 0.4), col="red",
     main="", xlab="x", ylab="P[X=x]")
points(x3, b3, pch=16, col="red")
lines(x2, b2, col="blue")
points(x2, b2, pch=17, col="blue")
lines(x1, b1, col="black")
points(x1, b1, pch=15, col="black")

legends=c("n=30", "n=10", "n=5")
legend("topright", legend=legends, pch=c(16, 17, 15), col=c("red", "blue", "black"))
#dev.off()
