kor2015 <- read.csv("제대로 알고 쓰는 R 통계 분석/data/kor_pop_2015.csv", header = F, na.strings = c("."))

str(kor2015)
# 데이터 수정 필요
kor2015$V1 <- factor(kor2015$V1, 
                     levels = c(1,2), 
                     labels = c("남자", "여자"))

kor2015$V3 <- factor(kor2015$V3, 
                      levels = 1:14, 
                      labels = c("가구주(본인)", 
                                 "배우자", 
                                 "자녀", 
                                 "자녀의 배우자", 
                                 "가구주의 부모", 
                                 "배우자의 부모", 
                                 "친손자, 친손녀 및 그 배우자", 
                                 "증손자, 증손녀 및 그 배우자", 
                                 "조부모", 
                                 "형제자매 및 그 배우자", 
                                 "형제자매의 자녀 및 그 배우자", 
                                 "부모의 형제자매 및 그 배우자", 
                                 "기타 친척, 인척", 
                                 "그 외에 같이 사는 사람"
                                 ))

kor2015$V4 <- factor(kor2015$V4, 
                     levels = 1:5, 
                     labels = c("졸업", 
                                "재학", 
                                "수료", 
                                "휴학", 
                                "중퇴"))

head(kor2015)
kor2015 <- kor2015[, -c(5:6)]
names(kor2015) <- c("성별", "나이", "가구주와의관계", "학력")
# install.packages("tidyverse")
library(tidyverse)
theme_set(theme_bw(base_family = "NanumGothic")) # 한글 글씨체 적용 (font book)
glimpse(kor2015)

kor2015$숫자 <- 1

ggplot(kor2015, 
       aes(x = 성별, fill = 성별)) + 
  geom_histogram(stat = "count") + 
  stat_count(aes(y=..count..,
                 label=..count..), 
             geom="text", 
             vjust= - 0.5)

# install.packages("extrafont")
library(extrafont)
font_import()
fonts()

# 명수 입력
ggplot(kor2015, 
       aes(x = 성별, fill = 성별)) + 
  geom_histogram(stat = "count") + 
  stat_count(aes(y = ..count.., 
                 label = ..count..), 
             geom = "text", 
             vjust = -0.5)

library(scales)
# https://sebastiansauer.github.io/percentage_plot_ggplot2_V2/

# pie chart in R
# https://steemit.com/programming/@dkmathstats/pie-charts-in-r-with-ggplot2

# 두 변수 간의 관계를 나타내는 산점도
str(cars)
data("cars")
ggplot(cars, aes(speed, dist)) + 
  geom_point() + 
  labs(x = "속도(mph)", 
       y = "제동거리(ft)", 
       title = "속도와 제동거리", 
       subtitle = "선형관계의 두 변수", 
       caption = "from cars dataset")

# 시계열 자료인 Nile
data("Nile")  
class(Nile)
library(zoo)
library(scales)  

Nile
autoplot(as.zoo(Nile), geom = "line")

# Chapter 2. 모수와 통계량
# install.packages("readxl")
library(readxl)

ranicafe <- read_xls("제대로 알고 쓰는 R 통계 분석/data/cafedata.xls", na = "")
  ## 최대값과 최소값
str(ranicafe)
ranicafe$Coffees <- as.numeric(ranicafe$Coffees)
ranicafe$Coffees

sort(ranicafe$Coffees)
sort(ranicafe$Coffees)[1]
sort(ranicafe$Coffees, decreasing = TRUE)
sort(ranicafe$Coffees, decreasing = TRUE)[1]
min(ranicafe$Coffees)
max(ranicafe$Coffees)

# NA -> Median
ranicafe$Coffees[which(is.na(ranicafe$Coffees))] <- median(ranicafe$Coffees, na.rm = TRUE)

min(ranicafe$Coffees)
max(ranicafe$Coffees)

  ## 최빈값(mode)
rc <- ranicafe$Coffees
stem(rc)

  ## 평균값 중앙값
rc <- ranicafe$Coffees
weight <- (1 / length(rc))
sum(rc * weight)
mean(rc)

rc <- c(rc, NA)
tail(rc, n = 5)
mean(rc)
mean(rc, na.rm = TRUE)

rc <- na.omit(rc)
which(rc == 21 | rc == 22 ) # 16일, 17일, 33일
# which()는 논리벡터(참과 거짓으로 구성된 벡터)를 전달받아 참값의 인덱스를 반환해준다. 
x <- 1:6
x %% 2 == 0
which(x %% 2 == 0)

rc <- ranicafe$Coffees
rc[rc == max(rc)] <- 480
mean(rc)

  ## Median(중앙값)
rc <- ranicafe$Coffees
# 값이 홀수(odd number) 일 때 해당한다. 
(median.idx <- (length(rc) + 1) / 2)

# 값이 짝수(even number) 일 때 해당한다. 
(median.idx <- length(rc) / 2)

# sorting
rc.srt <- sort(rc)
rc.srt[median.idx]
median(rc.srt)

# Median 양 끝 값의 변화값에 대해 민감하지 않다. 
rc <- ranicafe$Coffees
rc[rc == max(rc)] <- 1000 
median(rc)

# 평균과 중앙값, 그리고 최빈값이 비슷한 경우
x <- c(1, 2, 2, 3, 3, 3, 4, 4, 5)
library(tidyverse)
ggplot(data = NULL, aes(x)) + 
  geom_dotplot(binwidth = .2) + 
  geom_density() + 
  geom_vline(aes(xintercept = mean(x)), 
             color = "blue", 
             linetype = "dashed", 
             size = 2)

# 중앙값과 최빈값은 값지만, 평균이 다른 경우
y <- c(1, 1, 2, 2, 3, 3, 3, 4, 4)
ggplot(data = NULL, aes(y)) + 
  geom_dotplot(binwidth = .2) + 
  geom_density() + 
  geom_vline(aes(xintercept = mean(y)), 
             color = "blue", 
             linetype = "dashed", 
             size = 2)
## 이 경우가 꼬리가 왼쪽으로 기울어져 있다 = 치우쳐져 있다. (Left-Skewness)

# 중앙값과 최빈값은 값지만, 평균이 다른 경우
z <- c(2, 2, 3, 3, 3, 4, 4, 5, 5)

ggplot(data = NULL, aes(z)) + 
  geom_dotplot(binwidth = .2) + 
  geom_density() + 
  geom_vline(aes(xintercept = mean(z)), 
             color = "blue", 
             linetype = "dashed", 
             size = 2)
## 이 경우가 꼬리가 오른쪽으로 기울어져 있다 = 치우쳐져 있다. (Right-Skewness)

# How to get mode in R
# The only way is to create get mode function
n <- c(NA, NA, NA, 1, 1, 0, 0)
get.mode <- function(v) {
  v <- v[complete.cases(v)]
  unique.v <- unique(v)
  unique.v[which.max(tabulate(match(v, unique.v)))]
}

get.mode(n)

  ## 표준편차와 사분위수 분위
# 표준편차의 개념: 각 자료들이 평균에 대해서 평균적으로 얼마나 떨어져 있을까?
# 표준편차 구하는 공식
  ## 1. 개별 관찰값과 평균과의 차이를 계산합니다. 
  ## 2. 1에서 구한 값의 평균을 구합니다. 

# 편차 그리고 자유도
height <- c(164, 166, 168, 170, 172, 174, 176)
(height.m <- mean(height))
(height.dev <- height - height.m)
sum(height.dev)
# 편차들의 합이 0이 되는 것은 편차가 가진 가장 중요한 특징입니다. 이러한 편차들의 성질을 이용하여 자유도(Degrees of Freedom)
# 편차의 합이 0이므로 편차의 평균 또한 항상 0이 된다. 

# 편차 제곱의 평균 구하기
(height.dev2 <- height.dev ^ 2)
sum(height.dev2)
mean(height.dev2) # 편차 제곱의 평균을 분산이라고 한다. 
sqrt(mean(height.dev2)) # 분산의 제곱근을 표준편차(Standard deviance)

  ## "라니의 카페" 커피 판매량에 대한 평균과 표준편차
rc <- ranicafe$Coffees
rc.m <- mean(rc)
rc.sd <- sd(rc)
cat("커피 판매량", round(rc.m, 1), " +-", round(rc.sd, 2), "잔")
# 이 표준편차를 어떻게 받아들이는 것이 좋을 지 이야기해봅시다. 

coffee <- ranicafe$Coffees

ggplot(NULL, aes(coffee)) + 
  geom_dotplot() + 
  geom_density() + 
  geom_vline(aes(xintercept = mean(coffee)), 
            color = "blue", 
            linetype = "dashed", 
            size = 2)
