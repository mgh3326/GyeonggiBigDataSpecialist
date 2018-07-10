# 실습문제1
# 1. R에서 제공하는 cars 데이터셋에 대한 물음에 답하시오.
# (1) 이 데이터셋을 불러와서 CAR 객체(변수)에 저장하시오.
CAR <- cars
# (2) cars 데이터셋에 대한 도움말을 찾아 어떤 변수들로 구성되어 있는지 확인하시오.
? cars
# (3) cars 데이터셋의 구조를 확인하고, 데이터의 특징을 파악하여 설명하시오.
str(cars)
# 2. 다음과 같은 형식의 데이터가 주어진 경우에 대한 물음에 답하시오.
# x 5 7 8 9
# y 4 8 6 10
# z A B C D
# (1) 벡터 x, y, z를 생성하시오.
x <- c(5, 7, 8, 9)
y <- c(4, 8, 6, 10)
z <- c("A", "B", "C", "D")
# (2) x의 두 번째 원소와 y의 세 번째 원소를 비교하는 명령어를 작성하고 실행하시오.
x[2] > y[3]
# (3) x/y의 몫을 구하시오.
x %/% y
# (4) 벡터 x를 이용하여 2×2 행렬을 만드시오.
matrix(x, nrow = 2)
# (5) 벡터 x, y, z를 이용하여 데이터프레임 data를 생성하시오.
data <- data.frame(x, y, z)
# 3. 파일로 작성된 salary.csv 데이터를 R에서 읽어 데이터프레임으로 저장하고, 데이터
# 의 구조와 특징을 설명하시오.
salary <- read.csv("./data/salary.csv", header = T)
str(salary)
summary(salary)
# 4. ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라
# 는 데이터가 들어있다.
# (1) midwest 데이터를 데이터 프레임 형태로 불러온 후 데이터의 특징을 파악하여 설명
# 하시오.
install.packages("ggplot2")
library(ggplot2)
midwest <- (as.data.frame(midwest))
str(midwest)
summary(midwest)
class(midwest)
# (2) poptotal 변수를 total로, popasian 변수를 asian으로 수정하시오.
names(midwest)
names(midwest)[5] <- "total"
names(midwest)[10] <- "asian"
# (3) total, asian 변수를 이용해 ‘전체 인구 대비 아시아 인구 백분율’ 변수를 생성하고
# 분포가 어떠하진 확인하고 설명하시오.
head(midwest$total)
head(midwest$asian)
head(midwest$asian / midwest$total * 100)
midwest$asianOfTotalPercent <- midwest$asian / midwest$total * 100
summary(midwest$asianOfTotalPercent)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
# 0.0000  0.1737  0.2972  0.4872  0.5212  5.0705


# (4) 아시아 인구 백분율 전체 평균을 구하고 평균을 초과하면 “large”, 그 외에는
# “small”을 부여하는 변수를 생성하시오.
mean(midwest$asianOfTotalPercent)
if (midwest$asianOfTotalPercent > mean(midwest$asianOfTotalPercent)) {
  midwest$var <- "large"
} else{
  midwest$var <- "small"
}
midwest$var <-
  ifelse(midwest$asianOfTotalPercent > mean(midwest$asianOfTotalPercent),
         "large",
         "small")
midwest$var[midwest$asianOfTotalPercent > mean(midwest$asianOfTotalPercent)] <-
  "large"
midwest$var[midwest$asianOfTotalPercent <= mean(midwest$asianOfTotalPercent)] <-
  "small"
# (5) “large”, “small”에 해당하는 지역이 얼마나 되는 빈도를 구하여 확인하시오.
summary(midwest$var)
table(midwest$var)

x <- c(1, 2, 3, 4)
switch (x[2],
        "1" == print("one"),
        "2" == print("two"),
        "3" == print("three"),
        print("NOT"))


fibo <- function(n) {
  if (n == 1 || n == 2) {
    return(1)
  }
  return(fibo(n - 1) + fibo(n - 2))
}
fibo(1)

circle <- function(r) {
  return (r ^ 2 * 3.14)
}
circle(2)
circle(1)

squre <- function(upper, lower, height)
{
  return((upper + lower) * height / 2)
}
squre(1, 1, 1)
squre(1, 1, 3)

ls()
library(MASS)
options(digit = 3)
set.seed(1234)
mean <- c(230.7, 146.7, 3.6)
sigma <-
  matrix(
    c(15360.8, 6721.2,-47.1, 6721.2, 4700.9,-16.5,-47.1,-16.5, 0.3),
    nrow = 3,
    ncol = 3
  )
mydata <- mvrnorm(500, mean, sigma)
mydata <- as.data.frame(mydata)
names(mydata) <- c("y", "x1", "x2")
head(mydata)

head(iris)


lapply(iris[, 1:4], mean) # 데이터 프레임 iris에 함수 적용
apply(iris[, 1:4], 2, sum)
d <-
  as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)), ncol = 4, byrow = TRUE))

names(d) <- names(iris[, 1:4])
d
do.call(cbind, lapply(iris[, 1:4], mean))
data.frame(do.call(cbind, lapply(iris[, 1:4], mean)))
aa <- list(data.frame(name = "foo", value = 1),
           data.frame(name = "bar", value = 2))
# 리스트에 함수 rbind를 적용하고 데이터 프레임을 반환
do.call(rbind, aa) # 속도가 느린 단점이 있음
x <- sapply(iris[, 1:4], mean)
as.data.frame(x)
x
tapply(1:10, rep(1, 10), sum)
tapply(1:10, rep(c(1, 2), 5), sum)
m <- matrix(1:8, ncol = 2,
            dimnames = list(c("Spring", "Summer", "Fall", "Winter"), c("M", "F")))
tapply(m, list(c(1, 1, 2, 2, 1, 1, 2, 2), c(1, 1, 1, 1, 2, 2, 2, 2)), sum)

help(rnorm)
mapply(rnorm, c(1, 2, 3), c(0, 10, 100), c(1, 1, 1))
