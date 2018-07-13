?mosaicplot()
employee <- read.csv("./data/salary.csv", header = T)
head(employee)
hist(employee$salary)
boxplot(salary ~ year, data = employee)
hist(employee$salary[employee$negotiated == TRUE])
hist(employee$salary[employee$negotiated == FALSE])
hist(employee$salary[employee$gender == "M"])
hist(employee$salary[employee$gender == "F"])
summary(employee)
? fivenum()
fivenum(employee$salary)

mystats <- function(x, na.omit = FALSE) {
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x - m) ^ 3 / s ^ 3) / n
  kurt <- sum((x - m) ^ 4 / s ^ 4) / n - 3
  return(c(
    n = n,
    mean = m,
    skewness = skew,
    kurtosis = kurt
  ))
}
myvars <- c("incentive", "salary")
sapply(employee[myvars], mystats)
sapply(employee[myvars], mystats)
install.packages("Hmisc")
library(Hmisc)
myvars <- c("incentive", "salary")
describe(employee[myvars])
install.packages("pastecs")
library(pastecs)
myvars <- c("incentive", "salary")
stat.desc(employee[myvars])

install.packages("psych")
library(psych)
myvars <- c("incentive", "salary")
describe(employee[myvars])
stat.desc(employee[myvars], desc = FALSE)

describe(employee[myvars])

psych::describe(employee[myvars])

aggregate(employee[myvars], by = list(gender = employee$gender), mean)

aggregate(employee[myvars], by = list(year = employee$year), mean)

dstats <- function(x)
  sapply(x, mystats)
myvars <- c("incentive", "salary")
by(employee[myvars], employee$gender, dstats)

install.packages("doBy")
library(doBy)
summaryBy(salary + incentive ~ gender, data = employee, FUN = mystats)

library(psych)
myvars <- c("incentive", "salary")
describeBy(employee[myvars], list(gender = employee$gender))

table(c("a", "b", "b", "b", "b", "c", "c", "d"))

d <- data.frame(
  x = c("1", "2", "2", "1"),
  y = c("A", "B", "A", "B"),
  num = c(3, 5, 8, 7)
)
d

(xtabs(num ~ x + y, data = d))
(d2 <- data.frame(x = c("A", "A", "A", "B", "B")))
(xtabs( ~ x, d2))

xt <- xtabs(num ~ x + y, data = d)
xt
margin.table(xt, 1)
margin.table(xt, 2)
margin.table(xt)

xt
prop.table(xt, 1)

prop.table(xt, 2)

prop.table(xt)

library(vcd)
mytable <- xtabs( ~ Treatment + Improved, data = Arthritis)
mytable
margin.table(mytable, 1)
prop.table(mytable, 1)
margin.table(mytable, 2)
prop.table(mytable, 2)

library(vcd)
mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
addmargins(mytable)
addmargins(prop.table(mytable, 1), 2)
addmargins(prop.table(mytable, 2), 1)

install.packages("gmodels")
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)

mytable <- xtabs(~ Treatment + Sex + Improved, data = Arthritis)
mytable

ftable(mytable)

margin.table(mytable, 1)

margin.table(mytable, 2)

margin.table(mytable, 3)

margin.table(mytable, c(1, 3))

ftable(prop.table(mytable, c(1, 2)))

ftable(addmargins(prop.table(mytable, c(1, 2)), 3))


# 실습문제3 - 1
# 1. 파일로 제공되는 salary.csv 데이터를 R에서 읽어 데이터프레임으로 저장하고,  각 질
# 문에 답하시오.
# (1) R에서 제공하는 기술통계를 위한 함수들을 이용하여 각 변수에 대한 요약 통계량을
# 계산하시오.
# (base 패키지, Hmisc 패키지, pastecs 패키지, psych 패키지)
employee <- read.csv("./data/salary.csv", header = T)
head(employee)
hist(employee$salary)
boxplot(salary ~ year, data = employee)
summary(employee)

mystats <- function(x, na.omit = FALSE) {
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x - m) ^ 3 / s ^ 3) / n
  kurt <- sum((x - m) ^ 4 / s ^ 4) / n - 3
  return(c(
    n = n,
    mean = m,
    skewness = skew,
    kurtosis = kurt
  ))
}
myvars <- c("incentive", "salary", "year")
sapply(employee[myvars], mystats)

library(Hmisc)
myvars <- c("incentive", "salary", "year")
describe(employee[myvars])

library(pastecs)
myvars <- c("incentive", "salary", "year")
stat.desc(employee[myvars])

library(psych)
myvars <- c("incentive", "salary", "year")
describe(employee[myvars])
# (2) 성별(gender)에 따른 incentive와 salary에 대한 요약 통계량을 계산하시오.
aggregate(employee[myvars], by = list(gender = employee$gender), mystats)
# (3) 연도별(year)에 따른 incentive와 salary에 대한 요약 통계량을 계산하시오.
aggregate(employee[myvars], by = list(year = employee$year), mystats)

# (4) 입사연도(year),  성별(sex) 각각에 대한 분할표를 작성하시오.
(xtabs(~ year, data = employee))
(xtabs(~ gender, data = employee))
# (5) 입사연도(year)와 성별(sex)에 대한 분할표를 작성하시오.

credit_df <- read.csv("./data/credit.csv", header = T)
head(credit_df)
str(credit_df)
credit$Age
credit_df$Age <- as.factor(credit_df$Age)
str(credit_df)
freeq_Age <- xtabs( ~ Age, data = credit_df)
freeq_Age
margin.table(freeq_Age)
prop.table(freeq_Age)
cross_Age_Credit <- xtabs( ~ Age + Credit, data = credit_df)
cross_Age_Credit
margin.table(cross_Age_Credit, margin = 1)
margin.table(cross_Age_Credit, margin = 2)
margin.table(cross_Age_Credit)
prop.table(cross_Age_Credit, margin = 1)
prop.table(cross_Age_Credit, margin = 2)
prop.table(cross_Age_Credit)
freq_Income <- xtabs( ~ Income, data = credit_df)
freq_Income
barplot(freq_Income)
barplot(prop.table(freq_Income))

pie(freq_Income)
cross_Income_Credit <- xtabs( ~ Income + Credit, data = credit_df)

cross_Income_Credit

barplot(cross_Income_Credit,
        col = c("red", "blue", "green"),
        ylim = c(0, 60))
legend(locator(1),
       c("high", "low", "medium"),
       fill = c("red",
                "blue", "green"))
prop_Income_Credit <- prop.table(cross_Income_Credit, margin = 2)

prop_Income_Credit
barplot(
  prop_Income_Credit,
  col = c("red", "blue", "green"),
  ylim = c(0, 1.0),
  legend = rownames(prop_Income_Credit)
)

barplot(
  prop_Income_Credit,
  col = c("red", "blue", "green"),
  ylim = c(0, 1.0),
  beside = TRUE
)
legend(locator(1),
       c("high", "low", "medium"),
       fill = c("red",
                "blue", "green"))
mosaicplot(~ Age + Income + Credit, data = credit_df)
H0_prob <- rep(1 / 6, 6)
H0_prob

die_roll_300 <- replicate(300, sample(
  c(1:6),
  size = 1,
  replace = TRUE,
  prob = H0_prob
))
head(die_roll_300)
table_die_roll <- table(die_roll_300)
table_die_roll
chi_test <- chisq.test(table_die_roll, p = H0_prob)
chi_test

summary(chi_test)

chi_test$expected

var <- c(260, 265, 250, 270, 272, 258, 262, 268, 270, 252)

? qt()
? pt()
mean(var)
sd(var)
qt(1 - 0.025, length(var) - 1)
mean(var) + qt(0.975, length(var) - 1) * sd(var) / sqrt(length(var))
library(pastecs)
stat_life <- stat.desc(var)
stat_life
L <- stat_life[9] - stat_life[11]
U <- stat_life[9] + stat_life[11]
L
U
