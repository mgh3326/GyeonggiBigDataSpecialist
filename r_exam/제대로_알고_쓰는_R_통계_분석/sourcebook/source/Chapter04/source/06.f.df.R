df1 <- c(3, 10)
df2 <- c(5, 20)
x <- seq(0, 2, by=0.01)

f3.5 <- df(x, df1[1], df2[1])
f3.20 <- df(x, df1[1], df2[2])
f10.5 <- df(x, df1[2], df2[1])
f10.20 <- df(x, df1[2], df2[2])

plot(x, f3.5, type="l", ylim=c(0, 0.9), axes=F, xlab="x", ylab="")
axis(1)
lines(x, f3.20, lty=2)
lines(x, f10.5, lty=3)
lines(x, f10.20, lty=4)

legend("topright", paste("df :", c("3, 5", "3, 20", "10, 5", "10, 20")), lty=1:4, cex=0.7)
