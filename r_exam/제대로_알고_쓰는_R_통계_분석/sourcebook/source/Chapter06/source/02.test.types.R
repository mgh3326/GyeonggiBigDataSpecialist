#그림 6-5의 세 개의 그림을 각각 그립니다.
par(mar=c(0,1,1,1))
#양쪽검정
x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="", ylab="")
abline(h=0)
alpha <- 0.05
ul <- qt(1-(alpha/2), df=14)
ll <- -ul
polygon(c(-3, x[x<ll], ll), c(0, y[x<ll], 0), col=2)
polygon(c(ul, x[x>ul], 3), c(0, y[x>ul], 0), col=2)
text(-2.5, 0.1, expression(plain(P)(T<c[l]) == over(alpha, 2)))
text(2.5, 0.1, expression(plain(P)(T>c[u]) == over(alpha, 2)))
text(ll, -0.02, expression(c[l]==-t[alpha / 2]), cex=1.2)
text(ul, -0.02, expression(c[u]==t[alpha / 2]), cex=1.2)


# (왼쪽) 한쪽검정
x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="", ylab="")
abline(h=0)
alpha <- 0.05
ll <- qt(alpha, df=14)
polygon(c(-3, x[x<ll], ll), c(0, y[x<ll], 0), col=2)
text(-2.5, 0.1, expression(plain(P)(T<c[l]) == alpha))
text(ll, -0.02, expression(c[l]==-t[alpha]), cex=1.2)



# (오른쪽) 한쪽검정
x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="", ylab="")
abline(h=0)
alpha <- 0.05
ul <- qt(1-alpha, df=14)
polygon(c(ul, x[x>ul], 3), c(0, y[x>ul], 0), col=2)
text(2.5, 0.1, expression(plain(P)(T>c[u]) == alpha))
text(ul, -0.02, expression(c[u]==t[alpha]), cex=1.2)