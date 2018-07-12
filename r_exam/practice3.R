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
(xtabs( ~ year, data = employee))
(xtabs( ~ gender, data = employee))
# (5) 입사연도(year)와 성별(sex)에 대한 분할표를 작성하시오.