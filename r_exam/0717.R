# # 두 집단 차이 거정
# 모수 :  평균 -> 독립된(연속형) 두 모집단 종속된 -> paired
#         비율
#         빈도

# 2. 평균이 이고 분산이 인 정규모집단과 평균이  이고 분산이   인 정규모집단에서 독립적으로 각각 15개씩 랜덤하게 표본을 추출한 결과과 다음과 같다고 하자. 각 질문에
# 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께 기술하시오.

# 1) 표본 자료에 대한 데이터 객체를 생성하시오.
x <- c(39.1,
       38.4,
       32.5,
       42.3,
       43.9,
       39.6,
       40.2 ,
       38.0,
       42.3,
       34.6,
       41.4,
       38.7,
       41.9,
       37.9,
       36.9)
y <- c (55.3,
        50.2,
        47.0,
        65.2,
        44.0,
        46.7,
        48.8,
        36.6,
        57.5,
        51.1,
        46.7,
        42.6,
        65.6,
        56.4,
        38.4)

# 2) 두 모집단에서 관측한 데이터에 대한 상자그림표를 그리고 자료에 대한 분포에 대하여 설명하시오.
boxplot(x, y, names = c("A", "B"))
box <- boxplot(x, y, names = c("A", "B"))
? boxplot
box$stats # 최소 최대 4분위수
# [,1]  [,2]
# [1,] 32.50 36.60
# [2,] 37.95 45.35
# [3,] 39.10 48.80
# [4,] 41.65 55.85
# [5,] 43.90 65.60

# 3) 각 표본에 대한 평균과 표준편차를 구하시오.
mean(x)
mean(y)
sd(x)
sd(y)
# 4) 두 모집단이 정규분포를 따른다고 할 수 있는지 유의수준 5%로 검정하시오.
? shapiro.test # Performs the Shapiro-Wilk test of normality.

shapiro.test(x)
shapiro.test(y)
# p-value = 0.7022
# p-value = 0.6617
# p-value > 0.05이므로 데이터가 정규 분포를 따른다는 귀무가설을 기각할 수 없다.

# 5) 두 모집단의 분산이 같다고 할 수 있는지 유의수준 5%로 점정하시오.
var.test(x, y)
var_test <- var.test(x,
                     y,
                     ratio = 1,
                     alternative = "two.sided",
                     conf.level = 0.95)
var_test
# p-value = 0.0003937
# p-value가 0.05보다 작으므로 분산은 유의미하게 다르다고 볼수 있습니다.

# 6) 두 모집단의 모평균 차이를 추정하시오.
t.test(x, y, var.equal = FALSE)

#p-value = 0.0002159
# 차이가 유의미하다.
# 7) 두 모집단의 모평균 차이에 대하여 95% 신뢰구간을 구하시오.
# 95 percent confidence interval:
# -15.92532  -5.99468
# 8) 두 모집단의 모평균이 같다고 할 수 있는지 유의수준 5%로 검정하시오.
# 3. 운동요법이 몸무게에 영향을 미치는지를 조사하기 위해 15명을 대상으로 운동요법 실시
# 전후의 몸무게를 측정하였다. 각 질문에 대한 답을 기술하되, R을 이용하고 R코드와 결
# 과도 함께 기술하시오.
# 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

# 1) 이 자료에 대한 데이터 객체를 생성하시오.
x <- c(71, 72, 66, 69, 69, 69, 70, 67, 72, 67, 71, 72, 69, 69, 70)
y <- c(69, 67, 68, 68, 70, 67, 67, 64, 65, 64, 66, 70, 70, 67 , 66)
# 2) 운동 전후 체중 차이에 대한 상자그림표를 작성하고 결과를 해석하시오.
boxplot(x, y, names = c("A", "B"))
box <- boxplot(x, y, names = c("A", "B"))
#? boxplot
# box$stats # 최소 최대 4분위수
# [,1] [,2]
# [1,]   66 64.0
# [2,]   69 66.0
# [3,]   69 67.0
# [4,]   71 68.5
# [5,]   72 70.0

# 3) 운동 전후 체중 차이가 정규분포를 따른다고 할 수 있는지 유의수준 5%로 검정하시오.
shapiro.test(x)
shapiro.test(y)
# p-value = 0.1989
# p-value = 0.2741
# 0.05보다 크므로 정규분포를 따른다.
# 4) 체중 차이에 대한 표본평균과 표준편차를 구하시오.
mean(x)
mean(y)
sd(x)
sd(y)
# 5) 운동 전후 체중의 모평균 차이에 대한 95% 신뢰구간을 구하시오.
var.test(x, y)
# p-value = 0.8172
t.test(x, y, var.equal = TRUE)
# p-value = 0.002763
# 차이가 유의미하다.
# 6) 운동 후 체중이 감소했다고 할 수 있는지 유의수준 5%로 검정하고 결과를 기술하시오,

beans <- matrix(c(160, 40, 175, 125), nrow = 2, byrow = TRUE)
rownames(beans) <- c("region I", "region II")
colnames(beans) <- c("coffee_beans A", "coffee_beans B")
bean_prop <- prop.table(beans, margin = 1)
bean_prop
barplot(bean_prop, col = c("red", "blue"), beside = TRUE)
legend(locator(1), c("region I", "region II"), fill = c("red", "blue"))
prop_test <- prop.test(beans,
                       p = NULL,
                       alternative = "two.sided",
                       correct = FALSE)

prop_test
summary(prop_test)
prop <- prop_test$estimate
prop
diff_prop <- prop[1] - prop[2]
names(diff_prop) <- c("difference in mean")
diff_prop


# 4. 어떤 제조공장에서 생산라인 I에서 생산한 제품 300개를 랜덤 추출하여 조사한 결과 불량품이 6개, 생산라인 II에서 생산한 제품 400개를 랜덤 추출하여 조사한 결과 불량품이 10개가 발견되었다. 각 질문에 대한 답을 기술하되, R을 이용하고 R코드와 결과도 함께
x <- c(294 , 390)
y <- c(6 , 10)
var <- matrix(c(294, 6, 390, 10), nrow = 2, byrow = TRUE)
rownames(var) <- c("I", "II")
colnames(var) <- c("양호품", "불량품")
# 1) 각 셀의 비율을 구하라.
var_prop <- prop.table(var, margin = 1)
barplot(var_prop)
# 2) 생산라인 I의 불량률   과 생산라인 II의 불량률   와의 차이에 대한 95% 신뢰구간을 구하고, 결과에 대하여 해석하시오.
prop_test <- prop.test(var,
                       p = NULL,
                       alternative = "two.sided",
                       correct = FALSE)
prop_test
# p-value = 0.6614 0.05보다 크다.
summary(prop_test)
prop <- prop_test$estimate
prop
diff_prop <- prop[1] - prop[2]
names(diff_prop) <- c("difference in mean")
diff_prop

# 3) 두 생산라인에서의 제품 불량률이 다르다고 할 수 있는지 유의수준 5%로 검정하고 그 결과를 기술하시오.
# 4) 연속성보정을 실시하여 2)번과 3)번을 푸시오.
prop_test_correct <- prop.test(var,
                               p = NULL,
                               alternative =
                                 "two.sided",
                               correct = TRUE)
prop_test_correct

install.packages("MASS")
library(MASS)

View(UScrime)
str(UScrime)
help(lm)
m <- lm(dist ~ speed, cars)
m
summary(m)
coef(m)

fitted(m)
data.frame(cars$speed, cars$dist, fitted(m), residuals(m))
fitted(m)[1:4]
residuals(m)[1:4]
fitted(m)[1:4] + residuals(m)[1:4]
cars$dist[1:4]
confint(m)
deviance(m)
m
predict(m, newdata = data.frame(speed = 3))
coef(m) - 17.579095 + 3.932409 * 3 # 회귀계수로 직접 계산한 예측값
predict(m, newdata = data.frame(speed = 3), interval = "confidence")
predict(m, newdata = data.frame(speed = 3), interval = "prediction")
summary(m)
anova(m)
(full <- lm(dist ~ speed, data = cars))
(reduce <- lm(dist ~ 1, data = cars))
anova(reduce, full)
shapiro.test(residuals(m))
plot(cars$speed, cars$dist)
abline(coef(m))
summary(cars$speed)
predict(m, newdata = data.frame(speed = seq(4.0, 25.0, .2)), interval = "confidence")
speed <- seq(min(cars$speed), max(cars$speed), .1)
ys <-
  predict(m, newdata = data.frame(speed), interval = "confidence")
matplot(speed, ys, type = 'n')
matlines(speed, ys, lty = c(1, 2, 2), col = 1)

# 실습1
#  한 수출기업에서 원달러 환율과 수출액(억원)간의 관계 분석
#  회귀식(모형) 추정


# 환율이 영향을 주는 변수

x <-
  c(1095, 1110, 1086, 1074, 1098 , 1105 , 1163, 1124 , 1088, 1064)
y <- c(49 , 52, 48 , 49 , 50 , 51 , 50 , 51, 49, 48)
x<-x[-7]
y<-y[-7]

? lm
# 종속 독
m <- lm(y ~ x)
plot(m)
m
summary(m)
x_c<-x[-7]
y_c<-y[-7]
m1 <- lm(y_c ~ x_c)
summary(m1)
plot(m1)
coef(m)
coef(m1)
fitted(m)[1:4]
residuals(m)[1:4]
confint(m)
deviance(m)
#  회귀모형 가정에 대한 평가
#  회귀모형에 대한 평가
#  회귀식을 통한 예측
m
predict(m, newdata = data.frame(x = 0.2))
coef(m)
51.2613941  + 0.2292225 * 0.2
predict(m, newdata = data.frame(x = 0.2), interval = "confidence")
predict(m, newdata = data.frame(x = 0.2), interval = "prediction")
summary(m)
# 실습2
#  대학 졸업자의 근무연수와 연봉의 관계 분석
year <-
  c(26, 16, 20, 7 , 22, 15, 29, 28, 17, 3, 1 , 16, 19, 13, 27, 4 , 30, 8, 3, 12)
salary <-
  c(
    1267,
    887,
    1022,
    511,
    1193,
    795,
    1713,
    1477,
    991,
    455,
    324,
    944,
    1232,
    808,
    1296,
    486,
    1516 ,
    565 ,
    299,
    830
  )
#  회귀식(모형) 추정
m <- lm(salary ~ year)
m
summary(m)
coef(m)
plot(m)
fitted(m)[1:4]
residuals(m)[1:4]
confint(m)
deviance(m)
#  회귀모형 가정에 대한 평가
#  회귀모형에 대한 평가
#  회귀식을 통한 예측
predict(m, newdata = data.frame(year = 42))
coef(m)
51.2613941  + 0.2292225 * 0.2
predict(m, newdata = data.frame(year = 42), interval = "confidence")
predict(m, newdata = data.frame(year = 42), interval = "prediction")
summary(m)

