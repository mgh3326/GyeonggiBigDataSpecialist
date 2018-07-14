# 그림 6-6을 위한 R코드
# 자료 불러오기부터 다시 하였습니다.
data <- read.csv("./data/2016.6th.csv", header=T)
str(data)
tmp <- subset(data, 나이==7 )
height.p <- tmp$X104.키

set.seed(9)
height <- height.p[sample(length(height.p), 15)]
height

xbar <- mean(height)
mu0 <- 1220
s <- sd(height)
n <- length(height)
t.t <- (xbar - mu0) / (s / sqrt(n-1))

x <- seq(-3, 3, by=0.001)
y <- dt(x, df=14)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.38), main="", xlab="t", ylab="")
abline(h=0)
alpha <- 0.05
ul <- qt(1-(alpha/2), df=14)
ll <- -ul
polygon(c(-3, x[x<ll], ll), c(0, y[x<ll], 0), col=2)
polygon(c(ul, x[x>ul], 3), c(0, y[x>ul], 0), col=2)

arrows(t.t, 0.05, t.t, 0, length=0.1)
text(t.t, 0.07, paste("t=", round(t.t, 3)))

text(ll, -0.02, expression(-t[0.025]==-2.14))
text(ul, -0.02, expression(t[0.025]==2.14))