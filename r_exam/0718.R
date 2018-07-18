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
m2 <- lm(salary ~ year)
m2
plot(year, salary)

summary(m2)
coef(m2)
plot(m2)
#  which = 1 : Residuals vs Fitted values chart : 기울기가 0인것 같다.
#  which = 2 : Normal Q-Q :  기울기가 거의 1을 유지하므로 정규분포
#  which = 3 : Scale-Location

# which = 5 : Residuals vs Leverage 7번째 값을 버려야하나

fitted(m2)[1:4]
residuals(m2)[1:4]
confint(m2)
deviance(m2)
predict(m2, newdata = data.frame(year = 26))
252.37 + 42.92 * 26 # 회귀계수로 직접 계산한 예측값
shapiro.test(residuals(m2))
#잔차에 대한 정규성 검정 결과 p값이 0.05보다 커서 정규 분포를 따르는것 같다.
plot(year, salary)
abline(coef(m2))
#  회귀모형 가정에 대한 평가
#  회귀모형에 대한 평가
#  회귀식을 통한 예측

predict(m2, newdata = data.frame(year = 26), interval = "confidence")
predict(m2, newdata = data.frame(year = 26), interval = "prediction")
salary_c <- salary[-7]
year_c <- year[-7]
m2 <- lm(salary ~ year)
m2_c <- m2[-7]
m2_c <- m2[-7]
# 실습3
# ▫ UsingR::galton 데이터 셋을 이용하여 회귀분석 수행
install.packages("UsingR")
library(UsingR)
galton
summary(galton)
# p-value: < 2.2e-16
?  ? galton
plot(galton)
m3 <- lm(child ~ parent, galton)
summary(m3)
# 그래프가 거의 정사각형이다.
coef(m3)
plot(m3)
predict(m3, newdata = data.frame(parent = 70.5))
23.9415 + 0.6463 * 70.5 # 회귀계수로 직접 계산한 예측값
anova(m3)
predict(m3, newdata = data.frame(parent = 70.5), interval = "confidence")
predict(m3, newdata = data.frame(parent = 70.5), interval = "prediction")
summary(m3)
shapiro.test(residuals(m3))
#잔차에 대한 정규성 검정 결과 p값이 0.05보다 작아 귀무가설을 기각하여 정규분포를 따르지 않는 것으로 판단
#  회귀식(모형) 추정
#  회귀모형 가정에 대한 평가
#  회귀모형에 대한 평가
#  회귀식을 통한 예측


View(women)
head(women)
wolm = lm(weight ~ height, data = women)
shapiro.test(residuals(wolm))
plot(women$weight, women$height)
par(mforw = c(1, 1))
summary(wolm)
# 독립변수와 종속변수 사이가 선형의 관계가 아닌 곡선 관계인 경우
# 독립변수가 한 개인 다항식
# 다항회귀모형은 로 놓으면
# 다중선형 회귀모형과 같은 방법으로 분석할 수 있음


# (x, y) 에 대한 산점도 작성
x <- c(
  0.04,
  0.07,
  0.11,
  0.13,
  0.20,
  0.27,
  0.39,
  0.42,
  0.52,
  0.56,
  0.61,
  0.75,
  0.78,
  0.86,
  0.89,
  0.92,
  0.94,
  0.97,
  0.98,
  0.99
)
y <- c(
  1.42,
  1.41,
  1.37,
  1.34,
  1.26,
  1.21,
  1.13,
  1.08,
  1.05,
  1.04,
  1.02,
  0.96,
  0.98,
  0.97,
  0.98,
  0.97,
  0.99,
  0.98,
  0.98,
  0.98
)
plot(x, y)
# 단순선형회귀모형에 적합
summary(lm(y ~ x))
# 단순선형회귀모형 평가
plot(lm(y ~ x), which = 1)
# 잔차그림을 보면 랜덤하게 흩어져 있지 않고, 곡선 형태를 나타냄

# 이차 다항회귀모형 적합
poly_lm <- lm(y ~ poly(x, 2, raw = TRUE))
plot(poly_lm, which = 1)
#잔차그림을 보면 0을 중심으로 랜덤하게 흩어져 있음

# 이차 다항회귀모형 적합
# 회귀계수 추정
summary(poly_lm)
# 추정된 회귀모형 : Y= 1.481081 - 1.198724X + 0.0704680X^2

# 결정계수
# 결정계수는 0.9963으로 회귀모형에 대한 설명력이 단순회귀 모형으로 적합한 경우 (0.8758)보다 더 증가함
anova(poly_lm)
# 회귀모형의 유의성 검정
# 회귀모형의 유의성검정에서 p값은 2.2e-16으로 모형이 유의하다.

# 이차 다항회귀모형 적합
# 추정된 단순선형회귀모형과 2차다항회귀모형

b0 <- poly_lm$coefficients[1]
b1 <- poly_lm$coefficients[2]
b2 <- poly_lm$coefficients[3]
ft <- function(x) {
  b0 + b1 * x + b2 * x ^ 2
}
plot(x, y)
abline(lm(y ~ x))
curve(ft, 0, 1, add = TRUE)
# 단순선형회귀모형보다 이차다항회귀모형이 데이터에 더 적합함


#  단순선형회귀모형과 이차다항회귀모형의 비교
anova(lm(y ~ x), poly_lm)
# 이차다항회귀모형이 잔차제곱합이 많이 감소하였고, Pr(>F) 값이 거의 0에 가까워 이
# 차다항 모형이 기여하는 바가 아주 큼을 알 수 있다.

# 산점도
x1 <- c(
  507,
  391,
  488,
  223,
  274,
  287,
  550,
  457,
  377,
  101,
  170,
  450,
  309,
  291,
  375,
  198,
  641,
  528,
  500,
  570
)
x2 <- c(
  "F",
  "F",
  "F",
  "F",
  "F",
  "F",
  "F",
  "F",
  "F",
  "F",
  "M",
  "M",
  "M",
  "M",
  "M",
  "M",
  "M",
  "M",
  "M",
  "M"
)
y <- c(
  1096,
  759,
  965,
  698,
  765,
  703,
  968,
  805,
  912,
  588,
  281,
  527,
  439,
  318,
  412,
  370,
  1044,
  537,
  649,
  807
)
plot(x1, y, pch = x2)
# 희귀계수 추정
# 결정계수 및 모형의 유의성
tlm <- lm(y ~ x1)
summary(tlm)
#  추정된 회귀모형 : Y= 290.5677 + 1.01811X1
fm_lm <- lm(y ~ x1 + x2)
summary(fm_lm)
# 회귀계수 추정을 위해 사용한 행렬 X
model.matrix(fm_lm)
fm_lm <- lm(y ~ x1 + x2)
summary(fm_lm)
int_lm <- lm(y ~ x1 + x2 + x1:x2)
summary(int_lm)
model.matrix(int_lm)
int_lm <- lm(y ~ x1 + x2 + x1:x2)
summary(int_lm)
anova(tlm, fm_lm, int_lm)


fm_coef <- coefficients(fm_lm)
plot(x1, y, pch = x2)
abline(tlm)
abline(fm_coef[1], fm_coef[2],
       lty = 2, col = "red")
abline(fm_coef[1] + fm_coef[3], fm_coef[2],
       lty = 3, col = "blue")
legend(
  locator(1),
  c("F", "F+M", "M"),
  lty = c(2, 1, 3),
  col = c("red", "black", "blue")
)

int_coef <- coefficients(int_lm)
plot(x1, y, pch = x2)
abline(tlm)
abline(int_coef[1], int_coef[2],
       lty = 2, col = "red")
abline(int_coef[1] + int_coef[3],
       int_coef[2] + int_coef[4],
       lty = 3,
       col = "blue")
legend(
  locator(1),
  c("F", "F+M", "M"),
  lty = c(2, 1, 3),
  col = c("red", "black", "blue")
)


states <-
  as.data.frame(state.x77[, c("Murder", "Population", "Illiteracy", "Income", "Frost")])
cor(states)
install.packages("car")
library(car)
scatterplotMatrix(
  states,
  spread = FALSE,
  smoother.args = list(lty = 2),
  main = "Scatter plot Matrix"
)
fit <-
  lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
summary(fit)

fit <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)
summary(fit)
install.packages("effects")
# library(effects)
# plot(effect("hp:wt", fit, list(wt = c(2.2, 3.2, 4.2))), multiline = TRUE)
# ??vcov
states <-
  as.data.frame(state.x77[, c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit <-
  lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
confint(fit)

fit2 <- lm(weight ~ height + I(height ^ 2), data = women)
par(mfrow = c(2, 2))
plot(fit2)
fit <-
  lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
par(mfrow = c(2, 2))
plot(fit)

library(car)
fit <-
  lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
qqPlot(
  fit,
  labels = row.names(states),
  id.method = "identify",
  simulate = TRUE,
  main = "Q-Q Plot"
)


residplot <- function(fit, nbreaks = 10) {
  z <- rstudent(fit)
  hist(
    z,
    breaks = nbreaks,
    freq = FALSE,
    xlab = "Studentized Residual",
    main = "Distribution of Errors"
  )
  rug(jitter(z), col = "brown")
  curve(
    dnorm(x, mean = mean(z), sd = sd(z)),
    add = TRUE,
    col = "blue",
    lwd = 2
  )
  lines(
    density(z)$x,
    density(z)$y,
    col = "red",
    lwd = 2,
    lty = 2
  )
  legend(
    "topright",
    legend = c("Normal Curve", "Kernel Density Curve"),
    lty = 1:2,
    col = c("blue", "red"),
    cex = .7
  )
}
residplot(fit)

durbinWatsonTest(fit)

library(car)
crPlots(fit)
ncvTest(fit)
spreadLevelPlot(fit)

install.packages("gvlma")
library(gvlma)
gvmodel <- gvlma(fit)
summary(gvmodel)
library(car)
vif(fit)
sqrt(vif(fit)) > 2

library(car)
outlierTest(fit)

hat.plot <- function(fit) {
  p <- length(coefficients(fit))
  n <- length(fitted(fit))
  plot(hatvalues(fit), main = "Index Plot of Hat Values")
  abline(h = c(2, 3) * p / n,
         col = "red",
         lty = 2)
  identify(1:n, hatvalues(fit), names(hatvalues(fit)))
}
hat.plot(fit)

cutoff <- 4 / (nrow(states) - length(fit$coefficients) - 2)
plot(fit, which = 4, cook.levels = cutoff)
abline(h = cutoff, lty = 2, col = "red")

avPlots(fit,
        ask = FALSE,
        onepage = TRUE,
        id.method = "identify")
influencePlot(fit,
              id.method = "identify",
              main = "Influence Plot",
              sub = "Circle size is proportional to Cook's distance")

library(car)
summary(powerTransform(states$Murder))
boxTidwell(Murder ~ Population + Illiteracy, data = states)

str(mtcars)
fit <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)
summary(fit)

library(effects)
plot(effect("hp:wt", fit, ,
            list(wt = c(2.2, 3.2, 4.2))),
     multiline = TRUE)
View(mtcars)
help(mtcars)
install.packages("leaps")
library(leaps)
head(mtcars)
leaps <-
  regsubsets(mpg ~ cyl + disp + hp + drat + wt + qsec + vs + am + gear + carb,
             data = mtcars,
             nbest = 4)
plot(leaps, scale = "adjr2")

library(car)
subsets(leaps, statistic = "cp", main = "Cp Plot for All Subsets Regression")
abline(1, 1, lty = 2, col = "red")

leaps <-
  regsubsets(mpg ~ hp + wt + qsec + vs + am + gear + carb,
             data = mtcars,
             nbest = 3)
# nbest 독립변수 개수
plot(leaps, scale = "adjr2")
