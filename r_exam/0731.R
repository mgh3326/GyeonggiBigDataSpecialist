library(caret)
library(mlbench)
library(e1071)

data(Vowel)
data(Sonar)

set.seed(100)
ind1 <- createDataPartition(Sonar$Class, p = 0.7)
ind2 <- createDataPartition(Vowel$Class, p = 0.7)

train1 <- Sonar[ind1$Resample1,]
test1 <- Sonar[-ind1$Resample1,]
train2 <- Vowel[ind2$Resample1,-1]
test2 <- Vowel[-ind2$Resample1,-1]

m1 <- svm(Class ~ ., train1)
m1$nSV #support vector 각각 개수
m1$tot.nSV #support vector 총합

m1 <- svm(Class ~ ., train1, cost = 100)
m1$nSV #support vector 각각 개수
m1$tot.nSV #support vector 총합

m1 <- svm(Class ~ ., train1, cost = 300)
m1$nSV #support vector 각각 개수
m1$tot.nSV #support vector 총합

m1 <- svm(Class ~ ., train1, cost = 0.1)
m1$nSV #support vector 각각 개수
m1$tot.nSV #support vector 총합

m1$labels
m1$SV #scale 해준 값
m1$coefs #y=wx+b 에서의 w 값

pred1 <- predict(m1, test1)
confusionMatrix(pred1, test1$Class)$overall[1]

m2 <- svm(Class ~ ., train2)
pred2 <- predict(m2, test2)
c2 = confusionMatrix(pred2, test2$Class)
c2

data1 = read.table(choose.files(),
                   header = F,
                   sep = ',',
                   encoding = 'utf-8')
data1
names(data1) = c('X', 'Y')
plot(data1)
m3 = lm(Y ~ X, data1)
lines(data1$X, m3$fitted.values, lty = 3, col = 'green')
m4 = svm(Y ~ X, data1)
lines(data1$X, m4$fitted, lty = 2, col = 'blue')

m4$kernel
m2$kernel
? kernel
m5 = svm(Y ~ X, data1, kernel = 'radial')
lines(data1$X, m5$fitted, lty = 2, col = 'red')
### 위에 지각했다리

? tune.svm
tune(svm, Y ~ X, data = data1)

# perform a grid search
tuneResult <- tune(svm,
                   Y ~ X,
                   data = data1,
                   ranges = list(epsilon = seq(0, 1, 0.1), cost = 2 ^ (2:9)))

tuneResult

lines(data1$X, tuneResult$best.model$fitted, col = 'red')

mnist_tr = read.csv(choose.files(), header = F)
mnist_te = read.csv(choose.files(), header = F)
mnist_tr
mnist_te
library(caret)
library(mlbench)
library(e1071)
names(mnist_tr) = c('Y', paste('V', 1:(28 * 28), sep = ''))
names(mnist_te) = c('Y', paste('V', 1:(28 * 28), sep = ''))
str(mnist_tr)
mnist_tr$Y = as.factor(mnist_tr$Y)
mnist_te$Y = as.factor(mnist_te$Y)
train3 = createDataPartition(mnist_tr$Y, p = 0.1)
test3 = createDataPartition(mnist_te$Y, p = 0.1)

train4 = mnist_tr[train3$Resample1, ]
test4 = mnist_te[test3$Resample1, ]



mat1 = as.matrix(train4[1,-1], nrow = 28)
max(mat1)
str(mat1)
mat2 = mat1 / 255
mat3 = matrix(mat2, nrow = 28)
str(mat2)
image(mat3)
train4$Y[1]

str(train4)
dim(train4)

dim(mnist_tr)

? svm


m5 = svm(Y ~ ., train4)

pred5 = predict(m5, test4)

c3 = confusionMatrix(pred5, test4$Y)
c3

train5 = train4

train5[,-1] = sapply(train5[,-1], function(x)
  x / 255)
train5

m6 = svm(Y ~ ., train5)



## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("EBImage")

install.packages("readbitmap")
library(jpeg)
img1 = readJPEG("./images/img1.jpg")
str(img1)
class(img1)
dim(img1)
library('EBImage')
r1 = 50
c1 = 50
ch1 = 3
mat1 = matrix(ncol = r1 * c1 * ch1)
dir2 = list.dirs('.')
for (i in 1:length(dir2)) {
  files2 = list.files(dir2[i])
  for (j in 1:length(files2)) {
    img1 = resize(readJPEG(files[j]), r1, c1)
    mat1 = rbind(mat1, img1)
  }
}
img1 = resize(readJPEG("./images/img1.jpg"), 50, 50)

class(img1)
dim(img1)
dir1 = list.dirs('.')
dir1
list.files('./images')
files2 = list.files(dir1[19])
files2

# 목적함수

# 쌍대 문제

m6 = svm(Y ~ ., train5)

m6$probA
m6$probB
m6$coefs


#인공신경망
?  ? Mxnet

Mxnet

