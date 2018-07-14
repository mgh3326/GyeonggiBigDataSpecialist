# 그림 6-4
par(mar=c(0.5,1,1,1))
x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="t", ylab="")
abline(h=0)
alpha <- 0.05
ul <- qt(1-(alpha/2), df=14)
ll <- -ul
polygon(c(-3, x[x<ll], ll), c(0, y[x<ll], 0), col=2)
polygon(c(ul, x[x>ul], 3), c(0, y[x>ul], 0), col=2)
text(-2.5, 0.1, expression(plain(P)(T<t) == 0.025), cex=0.7)
text(2.5, 0.1, expression(plain(P)(T>t) == 0.025), cex=0.7)
text(ll, -0.02, expression(-t[0.025]==-2.14), cex=0.8)
text(ul, -0.02, expression(t[0.025]==2.14), cex=0.8)
