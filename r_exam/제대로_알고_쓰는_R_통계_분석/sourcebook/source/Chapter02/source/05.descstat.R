ranicafe <- read.csv("./data/cafedata.csv", header=T, na.strings="na", stringsAsFactors=FALSE )
ranicafe <- na.omit(ranicafe)
str(ranicafe)
#Fig 1
install.packages("ggplot2")
library(ggplot2)
ggplot(ranicafe, aes(Coffees)) + 
  geom_bar(fill="gray") + 
  ggtitle("라니의 카페 커피 판매량") + 
  theme(plot.title = element_text(size = 20, face="bold")) +
  xlim(0, 50) + xlab("판매량") +
  ylab("횟수") + scale_y_continuous(breaks=0:10)

# 최소값과 최대값
ranicafe$Coffees
sort(ranicafe$Coffees)
sort(ranicafe$Coffees)[1]  
sort(ranicafe$Coffees, decreasing=TRUE)
sort(ranicafe$Coffees, decreasing=TRUE)[1]  
min( ranicafe$Coffees )
max( ranicafe$Coffees )

# 줄기-잎 그림
table(cut(ranicafe$Coffees, breaks=seq(0, 50, by=10), right=F))
rc <- ranicafe$Coffees
stem(rc)
max( table(rc) )



# 평균
rc <- ranicafe$Coffees
weight <- (1/length(rc))
sum( rc * weight )
mean( rc )

## 자료 중에 결측값(NA)가 있을 경우
rc <- c(rc, NA)
tail(rc, n=5)
mean( rc )
mean( rc, na.rm=TRUE )


length(rc)
rc <- ranicafe$Coffees
rc
which(rc==21 | rc==22)


# 양끝 값의 변화에 대한 평균의 변화
rc <- ranicafe$Coffees
rc[rc == max( rc )] <- 480
mean( rc )


# 중앙값
rc <- ranicafe$Coffees
( median.idx <- ( length(rc)+1 ) / 2 )
( rc.srt <- sort(rc) )
rc.srt[ median.idx ]
median( rc )


# 양끝 값의 변화에 대한 중앙값의 변화
rc <- ranicafe$Coffees
rc[rc == max( rc )] <- 480
( m2 <- median( rc ) )


# 평균과 중앙값의 관계 : 같을 경우
mm <- c(1, 2, 2, 3, 3, 3, 4, 4, 5)
mean(mm)
median(mm)


# 평균과 중앙값의 관계 : 평균이 작을 경우
mm2 <- c(1, 1, 2, 2, 3, 3, 3, 4, 4)
mean(mm2)
median(mm2)


# 평균과 중앙값의 관계 : 평균이 클 경우
mm3 <- c(2, 2, 3, 3, 3, 4, 4, 5, 5)
mean(mm3)
median(mm3)


# 개별 관찰값과 평균과의 차이에 대한 평균
height <- c(164, 166, 168, 170, 172, 174, 176)
( height.m <- mean( height ) )
( height.dev <- height - height.m )
sum( height.dev )

# 편차 제곱의 평균
( height.dev2 <- height.dev ^ 2 )
sum( height.dev ^ 2 ) / length( height.dev )
mean( height.dev ^ 2 )

# 표준편차
sqrt( mean( height.dev ^ 2 ) )

# R 함수를 이용한 분산과 표준편차
var( height )
sd( height )


# 라니의 카페의 커피 판매량에 대한 평균과 표준편차
rc <- ranicafe$Coffees
rc.m <- mean( rc )
rc.sd <- sd( rc )
cat("커피 판매량", round(rc.m,1), "±", round(rc.sd,2), "잔")


# 정규분포 (그림 2-20)
par(mar=c(2, 0, 0, 0))
x <- seq(-3, 3, by=0.001)
plot(x, dnorm(x), type="l", lwd=2, xlab="", ylab="", axes=F )
axis(1)
lines(c(0, 0), c(0, dnorm(0)), lty=1, lwd=1.5)
lines(c(-1, -1), c(0, dnorm(-1)), lty=3, lwd=2)
lines(c(1, 1), c(0, dnorm(1)), lty=3, lwd=2)



# 표준편차가 다른 두 자료 (그림 2-21)
par(mar=c(2, 0, 0, 0))
x <- seq(158, 182, by=0.01)
plot(x, dnorm(x, mean=170, sd=4), type="l", lwd=2, ylim=c(0, 0.2), axes=F)
lines(x, dnorm(x, mean=170, sd=2), lty=2, lwd=2)
axis(1)

legend("topright",
       lwd=2,
       lty=c(1,2),
       c(paste("sd :", 4), paste("sd :", 2))
)


# 변동계수
rc <- ranicafe$Coffees
rj <- ranicafe$Juices
( rc.m <- mean( rc ) )
( rc.sd <- sd( rc ) )
( rj.m <- mean( rj ))
( rj.sd <- sd( rj ) )
( rc.cv <- round( rc.sd / rc.m, 3) )
( rj.cv <- round( rj.sd / rj.m, 3) )



# 사분위수 범위와 상자도표 [그림 2-22]
( qs <- quantile(rc) )
print( qs[4] - qs[2] )
IQR(rc)
par(mar=c(2, 2, 2, 2))
bp <- boxplot(rc, main="커피 판매량에 대한 상자도표", axes=F)
axis(2)

md <- median(rc)
arrows(1.4, qs[4], 1.22, qs[4], angle=30, length=0.1)
text(1.42, qs[4], "Q3", adj=0)
arrows(1.4, md, 1.22, md, angle=30, length=0.1)
text(1.42, md, "Q2", adj=0)
arrows(1.4, qs[2], 1.22, qs[2], angle=30, length=0.1)
text(1.42, qs[2], "Q1", adj=0)


# 제동거리의 히스토그램
hist(cars$dist, breaks = seq(0, 120, 10))
# 상자도표와 이상치
boxplot(cars$dist)

