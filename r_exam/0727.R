library(MASS)
Iris <- data.frame(rbind(iris3[, , 1], iris3[, , 2], iris3[, , 3]),
                   Sp = rep(c("s", "c", "v"), rep(50, 3)))
train <- sample(1:150, 75)
table(Iris$Sp[train])
fit <- lda(Sp ~ ., Iris, prior = c(1, 1, 1) / 3, subset = train)
fit
hat <- predict(fit, Iris[-train,])
hat
ct <- table(Iris$Sp[-train], hat$class)
ct
library(MASS)
tr <- sample(1:50, 25)
train <- rbind(iris3[tr, , 1], iris3[tr, , 2], iris3[tr, , 3])
test <- rbind(iris3[-tr, , 1], iris3[-tr, , 2], iris3[-tr, , 3])
cl <- factor(c(rep("s", 25), rep("c", 25), rep("v", 25)))
fit2 <- qda(train, cl)
hat2 <- predict(fit2, test)
ct2 <- table(cl, hat2$class)
ct2
diag(prop.table(ct2, 1))



# 1) 소스 데이터를 시계열 데이터로 변환
ts(data, frequency = n, start = c(시작년도,         월))

# 2) 시계열 데이터를 x, trend, seasonal, random 값으로 분해
decompose(data)

# 3) 시계열 데이터를 이동평균한 값 생성
SMA(data, n =         이동평균수)

# 4) 시계열 데이터를 차분
diff(data, differences =         차분횟수)

# 5) ACF 값과 그래프를 통해 래그 절단값을 확인
acf(data, lag.max =         래그수)

# 6) PACF 값과 그래프를 통해 래그 절단값을 확인
pacf(data, lag.max =         래그수)

# 7) 데이터를 활용하여 최적의 ARIMA 모형을 선택
auto.arima(data)

# 8) 선정된 ARIMA 모형으로 데이터를 보정(fitting)
arima(data, order = c(p, d, q))

# 9) ARIMA 모형에 의해 보정된 데이터를 통해 미래값을 예측
forecast.Arima(fittedData, h =         미래예측수)

# 10) 시계열 데이터를 그래프로 표현
plot.ts(시계열데이터)

# 11) 예측된 시계열 데이터를 그래프로 표현
plot.forecast(예측된시계열데이터)

install.packages("TTR")
install.packages("forecast")
library(TTR)
library(forecast)

kings <-
  scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
kings


# 시계열 데이터로 변환
kings_ts <- ts(kings)
kings_ts

plot.ts(kings_ts)

# 이동평균
kings_sma3 <- SMA(kings_ts, n = 3)
kings_sma8 <- SMA(kings_ts, n = 8)
kings_sma12 <- SMA(kings_ts, n = 12)

par(mfrow = c(2, 2))

plot.ts(kings_ts)
plot.ts(kings_sma3)
plot.ts(kings_sma8)
plot.ts(kings_sma12)

# 차분을 통해 데이터 정상화
kings_diff1 <- diff(kings_ts, differences = 1)
kings_diff2 <- diff(kings_ts, differences = 2)
kings_diff3 <- diff(kings_ts, differences = 3)

plot.ts(kings_ts)
plot.ts(kings_diff1)    # 1차 차분만 해도 어느정도 정상화 패턴을 보임
plot.ts(kings_diff2)
plot.ts(kings_diff3)

par(mfrow = c(1, 1))

mean(kings_diff1)
sd(kings_diff1)

# 1차 차분한 데이터로 ARIMA 모형 확인
acf(kings_diff1, lag.max = 20)      # lag 2부터 점선 안에 존재. lag 절단값 = 2. --> MA(1)

pacf(kings_diff1, lag.max = 20)     # lag 4에서 절단값 --> AR(3)

# 자동으로 ARIMA 모형 확인
auto.arima(kings)   # --> ARIMA(0,1,1)

# 예측
kings_arima <-
  arima(kings_ts, order = c(3, 1, 1))    # 차분통해 확인한 값 적용
kings_arima

# 예측
kings_arima <- arima(kings_ts, order = c(3,1,1))    # 차분통해 확인한 값 적용
kings_arima


kings_fcast <- forecast.Arima(kings_arima, h = 5)
kings_fcast

