# 표본의 크기에 따른 이항분포의 확률분포도
n <- c(2, 8, 16, 64)
p <- 0.6

# 그림 D-3
#jpeg("./output/07.binom.jpg", width=800, height=600, quality=100)
par(mfrow=c(2,2), mar=c(2,2,2,0))
for(i in 1:length(n)) {
  b.p <- dbinom(0:n[i], size=n[i], prob=p)
  barplot(b.p, names=0:n[i], main=paste("n=", n[i], sep=""))
}
#dev.off()


#그림 D-4
# 연속성 수정 안할 시 정규분포와 비교 
#jpeg("./output/08.binom2norm.jpg", width=400, height=300, quality=100)
par(mfrow=c(1,1), mar=c(2,2,2,0))
x <- seq(25, 55, by=.01)
x.b <- 25:55
plot(x, pnorm(x, 38.4, sqrt(15.36)), type="l", ylab="이항분포의 누적확률", axes=F)
axis(1)
axis(2)
points(x.b[11:21], pch=16, pbinom(x.b[11:21], 64, .6), col=2)
points(x.b[-(11:21)], pch=16, pbinom(x.b[-(11:21)], 64, .6))
#dev.off()


#그림 D-5
# 연속성 수정시 정규분포와 비교 
#jpeg("./output/09.binom2norm.jpg", width=400, height=300, quality=100)
par(mfrow=c(1,1), mar=c(2,2,2,0))
x <- seq(25, 55, by=.01)
x.b <- 25:55
plot(x, pnorm(x+0.5, 38.4, sqrt(15.36)), type="l", ylab="이항분포의 누적확률", axes=F)
axis(1)
axis(2)
points(x.b[11:21], pch=16, pbinom(x.b[11:21], 64, .6), col=2)
points(x.b[-(11:21)], pch=16, pbinom(x.b[-(11:21)], 64, .6))
#dev.off()