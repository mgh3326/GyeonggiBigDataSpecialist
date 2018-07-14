# 그림 6-7
par(mar=c(0,1,1,1))
x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="t", ylab="")
abline(h=0)
alpha <- 0.05
ul <- qt(1-(alpha/2), df=14)
ll <- -ul

polygon(c(-3, x[x<ll], ll), c(0, y[x<ll], 0), col=2)
polygon(c(ul, x[x>ul], 3), c(0, y[x>ul], 0), col=2)
text(ll, -0.02, expression(-t[0.025]==-2.14))
text(ul, -0.02, expression(t[0.025]==2.14))


t.t <- 0.727
p.value <- 1 - pt(t.t, df=14)
polygon(c(t.t, x[x>t.t], 3), c(0, y[x>t.t], 0), density=20, angle=45)
text(t.t, -0.02, paste("t=", round(t.t, 3)))

text(1.7, 0.2, paste("P(T>t)=",round(p.value, 3)))
arrows(1.7, 0.18, 1.5, dt(1.5, df=14), length=0.1)

