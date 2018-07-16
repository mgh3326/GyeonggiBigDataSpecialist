# R에서 제공하는 다음의 데이터셋들의 구조를 확인하고,  각 변수별 분포 및 연관성 있는 변수들 간의 관계를 표현하기에 적절한 함수를 사용하여 플롯을 작성하시오.
# (1) cars
cars
help(cars)
str(cars)
View(cars)
plot(cars)
X <- cars$speed
boxplot(X)
# 이상치가 있는지 없는지 분석
hist(cars$speed)
hist(cars$dist)
summary(cars)
class(cars)
prop.table(cars)
table(cars)
barplot(table(cars))
plot(cars[, 1:2])
abline(lm(cars[, 2] ~ cars[, 1]))
cor(cars[, 1:2])
corrgram(cor(cars[, 1:2]), upper.panel = panel.conf)
# speed와 dist의 상관 계수 0.8068949
# (2) mtcars
mtcars

class(mtcars)
help(mtcars)
str(mtcars)
View(mtcars)
summary(mtcars)
Z <- mtcars$disp
mpg <- mtcars$mpg
hp <- mtcars$hp
dotchart(Z)
hist(Z)
plot(Z, mpg)
plot(Z, hp)
pairs(mtcars)

cyl <- mtcars$cyl
cyl.f <-
  factor(cyl,
         levels = ,
         labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
library(sm)
sm.density.compare(mpg, cyl)
legend(locator(1), levels(cyl.f))
mtcars[, 1:13]
plot(mtcars[, 1:13])
install.packages("corrgram")
library(corrgram)
corrgram(cor(mtcars[, 1:11]), upper.panel = panel.conf)
? mtcars
summary(mtcars)
plot(mtcars[, 1], mtcars[, 2])
abline(lm(mtcars[, 2] ~ mtcars[, 1]))
require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1 / 4)
coplot(
  mpg ~ disp | as.factor(cyl),
  data = mtcars,
  panel = panel.smooth,
  rows = 1
)

# mpg와 cyl의 상관계수 -0.85
plot(mtcars[, 1], mtcars[, 3])
abline(lm(mtcars[, 3] ~ mtcars[, 1]))
# mpg와 disp의 상관계수 -0.85
plot(mtcars[, 1], mtcars[, 6])
abline(lm(mtcars[, 6] ~ mtcars[, 1]))
# mpg와 disp의 상관계수 -0.87
plot(mtcars[, 2], mtcars[, 3])
abline(lm(mtcars[, 3] ~ mtcars[, 2]))
# cyl과 disp의 상관계수 0.90

? mtcars
plot(mtcars[, 2], mtcars[, 4])
abline(lm(mtcars[, 4] ~ mtcars[, 2]))
# cyl과 hp의 상관계수 0.83
plot(mtcars[, 2], mtcars[, 6])
abline(lm(mtcars[, 6] ~ mtcars[, 2]))
# cyl과 hp의 상관계수 -0.81

plot(mtcars[, 3], mtcars[, 6])
abline(lm(mtcars[, 6] ~ mtcars[, 3]))
# disp와 wt의 상관계수 0.86
# (3) Titanic
#범주형은 상관계수를 보면 안된다.
library(dplyr)
Titanic
class(Titanic)
plot(Titanic)
View(Titanic)

gender_submission <- read.csv("./data/gender_submission.csv")
test <- read.csv("./data/test.csv")
train <- read.csv("./data/train.csv")
training <- read.csv("./data/train.csv")
View(gender_submission)
View(test)
View(train)
table(training$Survived, training$Pclass)
addmargins(table(training$Survived, training$Pclass))
prop.table(table(training$Survived, training$Sex))
barplot(prop.table(table(training$Survived, training$Sex)))
chisq.test(table(training$Survived, training$Sex))

str(gender_submission)
str(test)
str(train)
corrgram(cor(train[, c(1, 2, 3, 6, 7, 8, 10)]), upper.panel = panel.conf)
corrgram(cor(test[, c(1, 2, 5, 6, 7, 9)]), upper.panel = panel.conf)
train[, c(1, 2, 3, 6, 7, 8, 10)]
rbind(test, train[, c(1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)])
str(rbind(test, train[, c(1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)]))
var <- rbind(test, train[, c(1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)])
str(var)
corrgram(cor(var[, c(1, 2, 5, 6, 7, 9)]), upper.panel = panel.conf)
var %>% filter(!is.na(Age))
var <- var %>% filter(!is.na(Age))
corrgram(cor(var[, c(1, 2, 5, 6, 7, 9)]), upper.panel = panel.conf)
var <- var %>% filter(!is.na(Fare))
corrgram(cor(var[, c(1, 2, 5, 6, 7, 9)]), upper.panel = panel.conf)
xtabs( ~ Age + Pclass, data = var)
margin.table(xtabs( ~ Age + Pclass, data = var), margin = 1)

chi_test_inde <- chisq.test(var$Pclass, var$Age)
chi_test_inde
chi_test_inde$observed
chi_test_inde$expected
chi_test_inde$statistic
chi_test_inde$p.value
#
# plot(var[, 2], var[, 3])
# abline(lm(var[, 3] ~ var[, 2]))
# # Pclass와 Age의 상관계수 -0.41
# plot(var[, 6], var[, 2])
# abline(lm(var[, 2] ~ var[, 6]))
# # Pclass와 Fare의 상관계수 -0.57
#

#평균은 연속형 데이터
#비율은 범주형 데이터 (빈도)
simple_random_sample <- sample(c(1:1000), 50, replace = TRUE)
simple_random_sample

x <- c(
  13.60,
  15.15,
  17.62,
  16.81,
  15.51,
  15.12,
  14.39,
  15.20,
  13.70,
  14.75,
  15.13,
  15.66,
  13.69,
  15.74,
  14.96,
  15.20,
  16.45,
  13.66,
  16.16,
  14.47
)
y <- c(
  13.77,
  13.63,
  12.63,
  14.13,
  13.50,
  13.09,
  13.96,
  13.41,
  14.03,
  14.25,
  13.47,
  13.43,
  13.24,
  14.61,
  13.82,
  14.07,
  15.96,
  13.69,
  14.25,
  14.50
)
boxplot(x, y, names = c("A", "B"))


box <- boxplot(x, y, names = c("A", "B"))
? boxplot
box$stats # 최소 최대 4분위수
box$out
box$group
var.test(x, y)
x_correct <- x[x != box$out[1]]
y_correct <- y[y != box$out[2]]
boxplot(x_correct, y_correct, names = c("A", "B"))
shapiro.test(x_correct)
shapiro.test(y_correct)

? qnorm
mean_z.test_two <-
  function(x,
           y,
           sigma1,
           sigma2,
           conf.level,
           alternative) {
    n <- length(x)
    m <- length(y)
    mean_x <- mean(x)
    mean_y <- mean(y)
    diff <- mean_x - mean_y
    z_alpha_half <- qnorm((1 - conf.level) / 2, lower.tail = FALSE)
    var_mean <- (sigma1 ^ 2 / n) + (sigma2 ^ 2 / m)
    lower_limit <- diff - z_alpha_half * sqrt(var_mean)
    upper_limit <- diff + z_alpha_half * sqrt(var_mean)
    z_statistic <- diff / sqrt(var_mean)
    p_value_R <- pnorm(z_statistic, lower.tail = FALSE)
    p_value_L <- pnorm(z_statistic, lower.tail = TRUE)
    p_value_two <- pnorm(abs(z_statistic), lower.tail = FALSE)
    if (alternative == "two_sided") {
      p_value <- 2 * p_value_two
      cat("Two sample Z-test", "\n")
    } else if (alternative == "greater") {
      p_value <- p_value_R
      cat("Two sample Z-test", "\n")
    } else {
      p_value <- p_value_L
      cat("Two sample Z-test", "\n")
    }
    result <-
      ifelse(p_value < (1 - conf.level), "Reject H0", "Accept H0")
    cat("Z_statistics = ", z_statistic, "\n")
    cat("p_value = ", p_value, "\n")
    if (alternative == "two_sided") {
      cat("alternative hyphothesis: true difference in mean is not equal to 0 ",
          "\n")
    } else if (alternative == "greater") {
      cat("alternative hyphothesis: true difference in mean is greater than 0 ",
          "\n")
    } else{
      cat("alternative hyphothesis: true difference in mean is less than 0 ",
          "\n")
    }
    cat(conf.level * 100,
        "% confidence interval :",
        lower_limit,
        upper_limit,
        "\n")
    cat("sample mean of x = ", mean_x, ", sample mean of y = ", mean_y, "\n")
    cat("sample estimate difference of mean=", mean_x - mean_y, "\n")
    cat("result = ", result)
  }
# 모평균 차이
# 모분산을 아는 경우
sigma1 <- 1.1
sigma2 <- 1.0
conf.level <- 0.95
alternative <- "two_sided"
mean_z.test_two(
  x = x_correct,
  y = y_correct,
  sigma1 = sigma1,
  sigma2 = sigma2,
  conf.level = conf.level,
  alternative = alternative
)

# 실습문제 5
# 1. 평균이   이고 분산이 100인 모집단과 평균이   이고 분산이 225인 모집단에서 독립적
# 으로 각각 40개씩 랜덤하게 표본을 추출한 결과 다음과 같이 자료가 수집되었다고 하자.
# 각 질문에 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께 기술하시오.
# 평균이   이고 분산이 100인 모집단에서
# 추출한 표본
# 평균이   이고 분산이 225인 모집단에서
# 추출한 표본

# 1) 표본 자료에 대한 데이터 객체를 생성하시오.

x <- c(
  91,
  115,
  96,
  90,
  120,
  108,
  82,
  118,
  105,
  97,
  113,
  119,
  90,
  106,
  116,
  92,
  108,
  115,
  114,
  101,
  96,
  96,
  96,
  97,
  89,
  99,
  90,
  85,
  91,
  124,
  93,
  90,
  100,
  100,
  91,
  96,
  120,
  78,
  96,
  114
)
y <- c(
  102,
  117,
  82,
  104,
  77,
  110,
  93,
  115,
  75,
  103,
  126,
  79,
  81,
  118,
  93,
  106,
  104,
  97,
  115,
  80,
  78,
  109,
  116,
  104,
  102,
  137,
  99,
  100,
  113,
  112,
  96,
  106,
  76,
  102,
  111,
  105,
  85,
  125,
  77,
  111
)
# 2) 두 모집단에서 관측한 데이터에 대한 상자그림표를 그리고 자료에 대한 분포에 대하여 설명하시오.
boxplot(x, y, names = c("A", "B"))
# 3) 각 표본에 대한 평균과 표준편차를 구하시오.
mean(x)
mean(y)

sd(x)
sd(y)
# 4) 두 모집단이 정규분포를 따른다고 할 수 있는지 유의수준 5%로 검정하시오.
shapiro.test(x)
shapiro.test(y)
#0.05 보다 안크다.
# 5) 두 모집단의 모평균 차이를 추정하시오.
sigma1 <- 10
sigma2 <- 15
conf.level <- 0.95
alternative <- "two_sided"
mean_z.test_two(
  x = x_correct,
  y = y_correct,
  sigma1 = sigma1,
  sigma2 = sigma2,
  conf.level = conf.level,
  alternative = alternative
)
# 6) 두 모집단의 모평균 차이에 대하여 95% 신뢰구간을 구하시오.
# 7) 두 모집단의 모평균이 같다고 할 수 있는지 유의수준 5%로 검정하시오.


# 2. 평균이   이고 분산이  
#  인 정규모집단과 평균이
#   이고 분산이  
#  인 정규모집단에서
# 독립적으로 각각 15개씩 랜덤하게 표본을 추출한 결과과 다음과 같다고 하자. 각 질문에
# 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께 기술하시오.
# 평균이   이고 분산이  
#  모집단에서
# 추출한 표본
# 평균이   이고 분산이  
#  인 모집단에서
# 추출한 표본
# 39.1 38.4 32.5
# 42.3 43.9 39.6
# 40.2 38.0 42.3
# 34.6 41.4 38.7
# 41.9 37.9 36.9
# 55.3 50.2 47.0
# 65.2 44.0 46.7
# 48.8 36.6 57.5
# 51.1 46.7 42.6
# 65.6 56.4 38.4
# 1) 표본 자료에 대한 데이터 객체를 생성하시오.
# 2) 두 모집단에서 관측한 데이터에 대한 상자그림표를 그리고 자료에 대한 분포에 대하여
# 설명하시오.
# 3) 각 표본에 대한 평균과 표준편차를 구하시오.
# 4) 두 모집단이 정규분포를 따른다고 할 수 있는지 유의수준 5%로 검정하시오.
# 5) 두 모집단의 분산이 같다고 할 수 있는지 유의수준 5%로 점정하시오.
# 6) 두 모집단의 모평균 차이를 추정하시오.
# 7) 두 모집단의 모평균 차이에 대하여 95% 신뢰구간을 구하시오.
# 8) 두 모집단의 모평균이 같다고 할 수 있는지 유의수준 5%로 검정하시오.

# 3. 운동요법이 몸무게에 영향을 미치는지를 조사하기 위해 15명을 대상으로 운동요법 실시 전후의 몸무게를 측정하였다. 각 질문에 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께 기술하시오.
# 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
# 운동전 71 72 66 69 69 69 70 67 72 67 71 72 69 69 70
# 운동후 69 67 68 68 70 67 67 64 65 64 66 70 70 67 66
# 1) 이 자료에 대한 데이터 객체를 생성하시오.
help(t.test)
# 2) 운동 전후 체중 차이에 대한 상자그림표를 작성하고 결과를 해석하시오.
# 3) 운동 전후 체중 차이가 정규분포를 따른다고 할 수 있는지 유의수준 5%로 검정하시오.
# 4) 체중 차이에 대한 표본평균과 표준편차를 구하시오.
# 5) 운동 전후 체중의 모평균 차이에 대한 95% 신뢰구간을 구하시오.
# 6) 운동 후 체중이 감소했다고 할 수 있는지 유의수준 5%로 검정하고 결과를 기술하시오,
# 4. 어떤 제조공장에서 생산라인 I에서 생산한 제품 300개를 랜덤 추출하여 조사한 결과 불
# 량품이 6개, 생산라인 II에서 생산한 제품 400개를 랜덤 추출하여 조사한 결과 불량품이
# 10개가 발견되었다. 각 질문에 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께
# 기술하시오.
# 제품
# 합계
# 양호품 불량품
# 생산라인
# Ⅰ 294 6 300
# Ⅱ 390 10 400
# 합계 684 16 700
# 1) 각 셀의 비율을 구하라.
# 2) 생산라인 I의 불량률   과 생산라인 II의 불량률   와의 차이에 대한 95% 신뢰구간을
# 구하고, 결과에 대하여 해석하시오.
# 3) 두 생산라인에서의 제품 불량률이 다르다고 할 수 있는지 유의수준 5%로 검정하고 그
# 결과를 기술하시오.
# 4) 연속성보정을 실시하여 2)번과 3)번을 푸시오.