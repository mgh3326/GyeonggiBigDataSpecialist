#실습문제2-2

#(1) cars 데이터의 각 변수들과의 관계를 그래프로 본뒤, 관계성이 높은 변수들끼리 비교를 해봤습니다.
cars
str(cars)
plot(cars, xlim = c(0, 130), ylim = c(0, 130))
cor.test(cars$speed, cars$dist, method = "pearson")

install.packages("corrgram")
library(corrgram)

#(2) mtcars 데이터의 각변수들과의 관계를 그래프로 본뒤, 관계성이 높은 변수들끼리 비교를 해봤습니다.
mtcars
str(mtcars)
library(corrplot)
corrplot(cor(mtcars), method = "ellipse")
cor.test(mtcars$mpg, mtcars$cyl, method = "pearson")
cor.test(mtcars$disp, mtcars$cyl, method = "pearson")



#(3) 제가 알고싶은것은 survived와 타 변수와의 관계였기에, 당연하게도 survived 값이 없는 test 데이터는 사용하지 않고 training 데이터만 사용하였습니다.
test <- read.csv("test.csv")
training <- read.csv("train.csv")
gender <- read.csv("gender_submission.csv")

View(test)
View(training)
View(gender)

table(training$Survived, training$Pclass)
addmargins(table(training$Survived, training$Pclass))
prop.table(table(training$Survived, training$Pclass))
barplot(
  prop.table(table(training$Survived, training$Pclass)),
  xlab = "class",
  beside = T,
  col = c("red", "blue"),
  legend = c("die", "live")
)
chisq.test(table(training$Survived, training$Pclass))
table(training$Survived, training$Sex)
prop.table(table(training$Survived, training$Sex))
barplot(
  prop.table(table(training$Survived, training$Sex)),
  beside = TRUE,
  col = c("red", "green"),
  legend = c("die", "live")
)
chisq.test(table(training$Survived, training$Sex))



#(4)
iris
str(iris)
plot(iris)
cor.test(iris$Petal.Width, iris$Sepal.Length, method = "pearson")



#(4-1)
str(states)
states <- data.frame(state.region, state.x77)
plot(states$Frost,
     states$Area,
     xlim = c(0, 60000),
     ylim = c(0, 60000))
cor.test(states$Frost, states$Area, method = "pearson")

# 이건 못했습니다.....



#(5)
library(ggplot2)
midwest
midwest <- as.data.frame(midwest)
str(midwest)
View(midwest)
corrplot(cor(midwest[, c(4:11, 17)]))
cor.test(midwest$popblack, midwest$popwhite, method = "pearson")




#(6)
library(vcd)
View(Arthritis)
k <- table(Arthritis$Treatment, Arthritis$Improved)
addmargins(k)
prop.table(k)
barplot(
  t(prop.table(k)),
  beside = T,
  ylab = "prop" ,
  legend = c("none", "some", "marked"),
  col = c("green", "blue", "red")
)
chisq.test(table(Arthritis$Treatment, ved))