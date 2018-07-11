# 1. 파일로 제공되는 salary.csv 데이터를 R에서 읽어 데이터프레임으로 저장하고, 각 질문에 답하시오.
salary <- read.csv("./data/salary.csv", header = T)
# (1) salary 변수와 incentive 변수에 대한 히스토그램을 각각 작성하시오.
hist(salary$salary)
hist(salary$incentive)
# (2) salary 변수와 incentive 변수에 관한 산점도를 작성하시오.
head(salary)
? pairs
pairs(salary[, 2:3])
plot(salary$salary)
# (3) 입사연도(year)별 성별(sex) 빈도에 대한 막대그래프를 작성하시오.
salary$year
salary$gender
table(salary$year, salary$gender)
table(salary$gender, salary$year)
barplot(
  table(salary$gender, salary$year),
  col = c("red", "blue"),
  legend = c("M", "F")
)
#2. R에서 제공하는 다음의 데이터셋들의 구조를 확인하고, 각 변수별 분포 및 연관성 있는 변수들 간의 관계를 표현하기에 적절한 그래프 함수를 사용하여 플롯을 작성하시오.
# (1) cars
cars
head(cars)
table(cars)
barplot(table(cars))
# (2) mtcars
mtcars
# (3) Titanic
Titanic
# (4) iris
iris
# (4) states <- data.frame(state.region, state.x77)
states <- data.frame(state.region, state.x77)
# (5) ggplot2 패키지에 있는 midwest : 미국 동북중부 437개 지역의 인구통계 정보
library(ggplot2)
midwest
rm(midwest)
# (6) Arthritis
library(vcd)
Arthritis
