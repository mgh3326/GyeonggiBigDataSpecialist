sort(cars$dist)
mean(cars$dist)
sd(cars$dist)
quantile(cars$dist)
hist(cars$dist, breaks=seq(0, 120, 10))
# 이상치 판별
( Q <- quantile(cars$dist) )
( ll <- Q[2] - 1.5 * IQR(cars$dist) )
( ul <- Q[4] + 1.5 * IQR(cars$dist) )

cars$dist[cars$dist < ll]
cars$dist[cars$dist > ul]

boxplot(cars$dist, main="Boxplot of Distance")