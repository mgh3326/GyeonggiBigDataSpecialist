library(caret)
library(mlbench)
library(e1071)

?svm
data(Sonar)
data(Vowel)
set.seed(100)
ind1=createDataPartition(Sonar$Class, p=0.7)
ind2=createDataPartition(Vowel$Class, p=0.7)

train1=Sonar[ind1$Resample1, ]
test1=Sonar[-ind1$Resample1, ]
train2=Vowel[ind2$Resample1, -1]
test2=Vowel[-ind2$Resample1, -1]

m1=svm(Class~., train1, cost=1)
m1$nSV
m1$tot.nSV

m1$labels
m1$SV
m1$coefs

pred1=predict(m1, test1)
c1=confusionMatrix(pred1,test1$Class)
c1
confusionMatrix(pred1,test1$Class)$overall[1]

m2=svm(Class~., train2)
pred2=predict(m2, test2)
c2=confusionMatrix(pred2, test2$Class)
c2

data1=read.table(choose.files(), 
                 header=F, sep=',',
                 encoding = 'UTF-8')
names(data1)=c('X', 'Y')
data1
plot(data1)
m3=lm(Y~X, data1)
lines(data1$X, m3$fitted.values, 
      lty=3,
      col='green')
m4=svm(Y~X, data1)
lines(data1$X, m4$fitted, lty=2,
      col='blue')
m4$kernel
m2$kernel
?kernel
m5=svm(Y~X, data1, kernel='radial')

lines(data1$X, m5$fitted, lty=2,
      col='red')

?tune.svm
tuneResult <- tune(svm, Y ~ X,  data = data1,
                   ranges = list(epsilon = seq(0,1,0.1), 
                                 cost = 2^(2:9)))
lines(data1$X, tuneResult$best.model$fitted,
      col='red')



mnist_tr=read.csv(choose.files(), header=F)
mnist_te=read.csv(choose.files(), header=F)

library(caret)
names(mnist_tr)=c('Y', paste('V', 1:(28*28), sep=''))
names(mnist_te)=c('Y', paste('V', 1:(28*28), sep=''))
str(mnist_tr)
mnist_tr$Y = as.factor(mnist_tr$Y)
mnist_te$Y = as.factor(mnist_te$Y)

train3=createDataPartition(mnist_tr$Y, p=0.1)
test3=createDataPartition(mnist_te$Y, p=0.1)


train4=mnist_tr[train3$Resample1,]
test4=mnist_te[test3$Resample1, ]


mat1=as.matrix(train4[1,-1], nrow=28)
max(mat1)
str(mat1)
mat2=mat1/255
mat3=matrix(mat2, nrow=28)
str(mat3)
image(mat3)
train4$Y[1]

str(train4)
dim(train4)
dim(mnist_tr)



m5=svm(Y~., train4)
pred5=predict(m5, test4)
c3=confusionMatrix(pred5, test4$Y)
c3

train5=train4
train5[,-1]=sapply(train5[,-1], function(x) x/255 )

m6=svm(Y~., train5)
m6$probA
m6$probB
m6$coefs

Mxnet