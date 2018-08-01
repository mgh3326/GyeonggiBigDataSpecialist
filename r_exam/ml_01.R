#sample(범위, 추출할 수, 비복원/복원,가중치)

hist(sample(1:3, 10000, 
            replace = T, 
            prob=c(3,5,8)))


n1=nrow(iris)
set.seed(100)
ind1=sample(1:n1, n1*0.7, replace = F)
class(ind1)
str(ind1)
train1=iris[ind1,]
test1=iris[-ind1,]

table(train1$Species)


install.packages("caret")
library(caret)

help(package='caret')
#createDataPartition(y, p=0.7)

ind2=createDataPartition(iris$Sepal.Length, p=0.7)
str(ind2)
train2=iris[ind2$Resample1,]
table(iris$Species)
table(train2$Species)
ind3=createDataPartition(iris$Species, p=0.7)
train3=iris[ind3$Resample1,]
test3=iris[-ind3$Resample1,]
table(train3$Species)

set1=15
bet1=n1/set1
seq(sample(1:bet1, 1), n1, bet1)

y1=lm(Sepal.Length~., train1[,1:4])
summary(y1)
View(iris)
SL = 2.13+0.58*SW+0.65*PL-0.43*PW
pred1=predict(y1, newdata=test1)


??sse
sse1=sum((test1$Sepal.Length-pred1)^2)
sse1
mse1=mean((test1$Sepal.Length-pred1)^2)
rmse1=sqrt(mse1)

?family
y2=glm(Sepal.Length~., data=iris[,1:4],
    family='gaussian')
summary(y2)



install.packages('mlbench')
library(mlbench)
data(Sonar)
View(Sonar)

set.seed(200)
ind4=createDataPartition(Sonar$Class, p=0.7)
train4=Sonar[ind4$Resample1,]
test4=Sonar[-ind4$Resample1,]

y4=glm(Class~., data=train4, family='binomial')
y4$coefficients
pred4=predict(y4, newdata=test4, type='response')
pred4
levels(test4$Class)
pred4_1=as.factor(ifelse(pred4>=0.5, "R", "M"))
t1=table(test4$Class, pred4_1)
sum(diag(t1))/sum(t1)

c1=confusionMatrix(pred4_1, test4$Class)
c1$overall[1]

# KNN, DT, RandomForest, SVM, 신경망, 딥러닝

??knn

library(class)
?knn
pred5=knn(train4[,1:60], test4[,1:60], train4$Class)
pred5



confusionMatrix(pred5, test4$Class)


data(Vowel)
View(Vowel)

install.packages('e1071')
library(e1071)
na1=naiveBayes(Class~., data=train4)
pred6=predict(na1, test4)

library(caret)
c2=confusionMatrix(pred6, test4$Class)
c2

ind5=createDataPartition(Vowel$Class, p=0.7)
train5=Vowel[ind5$Resample1, -1]
test5=Vowel[-ind5$Resample1, -1]

library(nnet)
?multinom
m1=multinom(Class~., train5, maxit=150)
m1$softmax
pred01=predict(m1, test5)
confusionMatrix(pred01, test5$Class)$overall[1]
library(class)
pred02=knn(train5[,-10], test5[,-10], train5$Class)
confusionMatrix(pred02, test5$Class)$overall[1]

m3=naiveBayes(Class~., train5)
pred03=predict(m3, test5)
confusionMatrix(pred03, test5$Class)$overall[1]


install.packages('party')
library(party)
?ctree
?ctree_control
m4=ctree(Species~., train3, controls = ctree_control(maxdepth = 2))
m4
plot(m4)

pred04=predict(m4, test3)
confusionMatrix(pred04, test3$Species)$overall[1]

m5=ctree(Class~., train4)
pred05=predict(m5, test4)
confusionMatrix(pred05, test4$Class)$overall[1]
plot(m5)

m6=ctree(Class~., train5)
pred06=predict(m6, test5)
confusionMatrix(pred06, test5$Class)$overall[1]

install.packages('randomForest')
library(randomForest)
m7=randomForest(Class~., train4)
pred07=predict(m7, test4)
confusionMatrix(pred07, test4$Class)$overall[1]

m8=randomForest(Class~., train5)
pred08=predict(m8, test5)
confusionMatrix(pred08, test5$Class)$overall[1]
