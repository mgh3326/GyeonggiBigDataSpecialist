qt(0.95, 10 - 1)
(6.6 - 7) / (0.5 / sqrt(10))
? pt
pt(0.05, 10 - 1)

xbar <- 6.6
n <- 10
sd <- 0.5
mu <- 7
alpha <- 0.05
t1 <- (xbar - mu) / (sd / sqrt(n))
pt(t1, n - 1) # p value
qt(0.95, 10 - 1)
qt(alpha, df = n - 1)
t1
alpha <- 0.01
qt(alpha, n - 1)
pt(t1, n - 1)
? table

table(credit_df$Credit)
c(26, 23, 101)
c(28, 72, 70)
xx <- matrix(c(26, 28, 23, 72, 101, 70),
             ncol = 3,
             dimnames = list(
               sex = c("F", "M"),
               credit = c("bad", "excellent", "fair")
             ))
x <- as.data.frame(xx)
x <- data.frame(c(26, 28), c(23, 72), c(101, 70))
names(x) <- c("bad", "excellent", "fair")
row.names(x) <- c("F", "M")
table(x)
prop.table(xx)

barplot(prop.table(xx))
chisq.test(xx)

#practice4
var <- matrix(
  c(62, 35, 28, 40, 72, 71, 37, 37, 57, 61, 76, 24),
  ncol = 4,
  dimnames = list(
    생산라인                                    = c("I", "II", "III"),
    결합유형                                    = c("A", "B", "C", "D")
  )
)
var
? addmargins()
addvar <- addmargins(var)
prop.table(var, margin = 1)
addmargins(prop.table(var, margin = 2))

prop.table(addmargins(var), margin = 1)
prop.table(addmargins(var), margin = 2)
prop.table(var)

barplot(var, beside = T)
barplot(t(var), beside = T)
chi_test <- chisq.test(var)
chi_test$expected

library(vcd)
mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
mytable

fisher.test(mytable)

library(MASS)
mytable <- xtabs( ~ W.Hnd + Clap, data = survey)
mytable
chisq.test(mytable)
fisher.test(mytable)

mytable <- xtabs(~ Treatment + Improved + Sex, data = Arthritis)
mantelhaen.test(mytable)

mytable <- xtabs( ~ Treatment + Improved, data = Arthritis)
assocstats(mytable)
plot(iris[, 1:4])
pairs(iris[, 1:4])

par(mfrow = c(2, 2))
plot(iris$Sepal.Length, iris$Sepal.Width)
abline(lm(Sepal.Width ~ Sepal.Length, data = iris))
plot(iris$Sepal.Width, iris$Petal.Length)
abline(lm(Petal.Length ~ Sepal.Width, data = iris))
plot(iris$Petal.Length, iris$Petal.Width)
abline(lm(Petal.Width ~ Petal.Length, data = iris))
plot(iris$Petal.Width, iris$Sepal.Length)
abline(lm(Sepal.Length ~ Petal.Width, data = iris))

cor(iris$Sepal.Width, iris$Sepal.Length)
cor(iris[, 1:4])
install.packages("corrgram")
library(corrgram)
corrgram(cor(iris[, 1:4]), upper.panel = panel.conf)
install.packages("corrplot")
library(corrplot)
corrplot(cor(iris[, 1:4]), method = "ellipse")
mid <- c(
  53.8,
  59.9,
  55.9,
  57.3,
  66.4,
  59.1,
  54.6,
  60.8,
  58.1,
  62.9,
  67.1,
  55.0,
  62.2,
  60.4,
  64.4,
  58.8,
  64.1,
  51.2,
  68.4,
  64.3
)
final <- c(
  58.0,
  57.7,
  64.2,
  64.7,
  71.4,
  64.8,
  56.7,
  67.6,
  64.6,
  66.5,
  65.4,
  63.5,
  70.0,
  61.2,
  61.5,
  64.8,
  67.4,
  57.5,
  66.9,
  64.5
)

plot(mid, final)
abline(lm(final ~ mid))
par(mfrow = c(1, 1))
cor(mid, final)
cor.test(mid, final, method = "pearson")

year <- c(2001:2005)
sale <- c(13, 8, 10, 15, 12, 15, 14, 15, 17, 19, 20, 21, 22, 21, 25)
supply <-
  c(94, 70, 90, 100, 95, 100, 85, 95, 105, 105, 110, 105, 104, 105, 212)

plot(sale, supply)
abline(lm(supply ~ sale))
cor(sale, supply)
cor.test(sale, supply, method = "pearson")

class(iris)
corrgram(cor(iris[, 1:4]), upper.panel = panel.conf)
iris[, 1:4]
var <- data.frame(sale, supply)
var[, 1:2]
corrgram(cor(var[, 1:2]), upper.panel = panel.conf)

corrplot(cor(var[, 1:2]), method = "ellipse")
class(var[, 1:2])
class(var)
year <- c(2001:2005)
advertises <-
  c(13, 8, 10, 15, 12, 15, 14, 15, 17, 19, 20, 21, 22, 21, 25)
sales <-
  c(94, 70, 90, 100, 95, 100, 85, 95, 105, 105, 110, 105, 104, 105, 121)

ad_data <- data.frame(year, advertises, sales)
cor(ad_data$advertises, ad_data$sales)

state.x77[, 1:6]
corrgram(cor(state.x77[, 1:6]), upper.panel = panel.conf)
corrplot(cor(state.x77[, 1:6]), method = "ellipse")
cov(state.x77[, 1:6])
cor(state.x77[, 1:6])
order(cor(state.x77[, 1:6]))
state <- state.x77[, 1:6]
plot(state[, 4], state[, 5])
abline(lm(state[, 5] ~ state[, 4]))
# Life Exp 와 Muder
# Illiteracy 와 Murder
plot(state[, 3], state[, 5])
abline(lm(state[, 5] ~ state[, 3]))
