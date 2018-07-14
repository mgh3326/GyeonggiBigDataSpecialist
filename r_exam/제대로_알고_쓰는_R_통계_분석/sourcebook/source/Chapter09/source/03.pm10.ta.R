# 그림 9-3
# 자료수집 방법은 블로그(http://randstat.tistory.com)를 통해 설명드리겠습니다.
pt <- read.csv("./data/pm10.traffic.accident.csv", header=T)
plot(pt$ta ~ pt$pm10, xlab="미세먼지(PM10)", ylab="교통사고 발생건수")
cor(pt$pm10, pt$ta)

## 책에서는 ggplot2 를 사용해 그림을 그려 봤습니다.
## ggplot2 에 대한 내용은 블로그(http://randstat.tistory.com)를 통해 설명드리겠습니다.
install.packages("ggplot2")
library(ggplot2)
ggplot(pt, aes(pm10, ta)) + geom_point(colour="blue", size=3) + theme_bw() + xlab("미세먼지(PM10)") + ylab("교통사고 발생건수")
