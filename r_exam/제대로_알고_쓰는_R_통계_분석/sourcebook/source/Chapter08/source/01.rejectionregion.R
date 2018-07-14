# 그림 8-1
x <- seq(0, 15, by=0.01)
dc <- dchisq(x, df=3)

alpha <- 0.05
tol <- qchisq(0.95, df=3)

par(mar=c(0,1,1,1))
plot(x, dc, type="l", axes=F, ylim=c(-0.03, 0.25), xlab="", ylab="")
abline(h=0)
tol.g <- round(tol, 2)
polygon(c(tol.g, x[x>tol.g], 15), c(0, dc[x>tol.g], 0), col="red")
text(0, -0.03, "0", cex=0.8)
text(tol, -0.03, expression(chi[0.05]^{2}==2.14), cex=0.8)

