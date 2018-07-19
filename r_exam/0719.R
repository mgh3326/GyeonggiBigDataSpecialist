






















y <-
  c(
    681,
    728,
    917,
    898,
    620,
    643,
    655,
    742,
    514,
    525,
    469,
    727,
    525,
    454,
    459,
    384,
    656,
    602,
    687,
    360
  )
x <- rep(c("소형", "준중형", "중형", "대형"), c(5, 5, 5, 5))
x <- factor(x)
y
aov.result <- aov(y ~ x)
summary(aov.result)

ya <- c(1, 4, 3, 3, 3, 3, 3)
yb <- c(4, 4, 3, 4, 4, 5, 4, 4)
yc <- c(4, 3, 4, 3, 4, 4, 3, 3, 3)

y <- c(ya, yb, yc)

x <- c(
  "A",
  "A",
  "A",
  "A",
  "A",
  "A",
  "A"
  ,
  "B",
  "B",
  "B",
  "B",
  "B",
  "B",
  "B",
  "B",
  "C",
  "C",
  "C",
  "C",
  "C",
  "C",
  "C",
  "C",
  "C"
)

sat <- data.frame(x, y)
sat

ma <- mean(ya)
mb <- mean(yb)
mc <- mean(yc)
my <- mean(y)
na <- length(ya)
nb <- length(yb)
nc <- length(yc)
r.df <- 2
e.df <- (na + nb + nc) - 3
SSR <-
  sum((ma - my) ^ 2) * na + sum((mb - my) ^ 2) * nb + sum((mc - my) ^
                                                            2) * nc
SSE <- sum((ya - ma) ^ 2) + sum((yb - mb) ^ 2) + sum((yc - mc) ^ 2)
MSR <- SSR / r.df
MSE <- SSE / e.df
f.stat <- MSR / MSE

alpha <- 0.05
pf(f.stat, r.df, e.df, lower.tail = alpha)
summary(aov(y ~ x))

str(mtcars)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am)
mtcars$carb <- factor(mtcars$carb)
str(mtcars)
plot(vs)
plot(gear)
plot(carb)
table(carb)
vs
plot(am)
gear
plot(gear)
? plot()
aovm <- aov(mpg ~ cyl, data = mtcars)
summary(aovm)
aovm <- aov(mpg ~ gear, data = mtcars)
summary(aovm)
library(gplots)
plotmeans(
  mpg ~ gear,
  data = mtcars,
  xlab = "Treatment",
  ylab = "Response",
  main = "Mean Plot with 95% CI"
)
attach(mtcars)
head(mtcars)
str(mtcars)
aggregate(mpg, by = list(cyl), FUN = mean)
aggregate(mpg, by = list(cyl), FUN = sd)
aggregate(mpg, by = list(gear), FUN = mean)
aggregate(mpg, by = list(gear), FUN = sd)
aggregate(mpg, by = list(vs), FUN = mean)
aggregate(mpg, by = list(vs), FUN = sd)
aggregate(mpg, by = list(carb), FUN = mean)
aggregate(mpg, by = list(carb), FUN = sd)
aggregate(mpg, by = list(am), FUN = mean)
aggregate(mpg, by = list(am), FUN = sd)
summary(mtcars)

plot(carb)
table(carb)
fit <- aov(mpg ~ gear)
summary(fit)
plot(gear)
plot(carb)
aovm <- aov(mpg ~ gear, data = mtcars)
summary(aovm)
plotmeans(
  mpg ~ gear,
  data = mtcars,
  xlab = "gear",
  ylab = "mpg",
  main = "Mean Plot with 95% CI"
)
plot(gear)
str(mtcars)
aovm <- aov(mpg ~ vs, data = mtcars)
summary(aovm)
plotmeans(
  mpg ~ vs,
  data = mtcars,
  xlab = "gear",
  ylab = "mpg",
  main = "Mean Plot with 95% CI"
)
aovm <- aov(mpg ~ carb, data = mtcars)
summary(aovm)
plotmeans(
  mpg ~ carb,
  data = mtcars,
  xlab = "gear",
  ylab = "mpg",
  main = "Mean Plot with 95% CI"
)
rm(mtcars)
mtcars
str(mtcars)
? mtcars
aovm <- aov(mpg ~ am, data = mtcars)
summary(aovm)
plotmeans(
  mpg ~ am,
  data = mtcars,
  xlab = "gear",
  ylab = "mpg",
  main = "Mean Plot with 95% CI"
)

plotmeans(
  mpg ~ gear + cyl,
  data = mtcars,
  xlab = "gear",
  ylab = "mpg",
  main = "Mean Plot with 95% CI"
)
aovm <- aov(mpg ~ cyl + gear, data = mtcars)
? aov
summary(aovm)
aovm <- aov(mpg ~ gear + cyl  , data = mtcars)
summary(aovm)
aovm <- aov(mpg ~  cyl * gear  , data = mtcars)
summary(aovm)
aovm <- aov(mpg ~ gear  * cyl   , data = mtcars)
summary(aovm)
install.packages("HH")
library(HH)
interaction2wt(mpg~cyl+gear,data = mtcars)
