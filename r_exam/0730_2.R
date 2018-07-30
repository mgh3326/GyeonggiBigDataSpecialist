setwd("C:\\Users\\callab\\Dropbox\\MachineLearning")
#sample(범위, 추출할 수, 비복원/복원, 가중치)

hist(sample(1:3, 10000, replace = T, prob = c(3,5,8)))

#### 랜덤샘플링####
sm.iris <- iris
n1 <- nrow(sm.iris)
set.seed(100)
# 수치형일때는 그냥 사용하지만 label형일때는 가중치 사용
ind1 <- sample(1:n1, n1*0.7 ,replace = F)
class(ind1)
str(ind1)
train1 <- iris[ind1,]
test1 <- iris[-ind1,]

table(train1$Species)

#### 층하추출####
install.packages("caret")
library(caret)
help(package='caret')
#createDataPartition(y, p=0.7)

ind2 <- createDataPartition(iris$Sepal.Length, p=0.7)
str(ind2)
train2 <- sm.iris[ind2$Resample1,]
table(sm.iris$Species)
table(train2$Species)
ind3 <- createDataPartition(iris$Species, p=0.7)
train3 <- sm.iris[ind3$Resample1,]
table(train3$Species)

#### 계통추출####
set1 <- 15
bet1 <- n1/set1
seq(sample(1:bet1, 1), n1, bet1)

y1 <- lm(Sepal.Length~., train1[,1:4])
y1 <- lm(Sepal.Length~., train1)
summary(y1)

