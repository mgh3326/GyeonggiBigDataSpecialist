cran <- getOption("repos")
cran["dmlc"] <-
  "https://apache-mxnet.s3-accelerate.dualstack.amazonaws.com/R/CRAN/"
options(repos = cran)
install.packages("mxnet")
library(mxnet)

help(package = 'mxnet')
library(mlbench)
data(Sonar)


Sonar[, 61] = as.numeric(Sonar[, 61]) - 1
#61번째가 y, mxnet은 범주형 변수를 인식 못해서 numeric으로 변환
contrasts(iris$Species)
#더미 방식 : 하나의 변수만 1로 만들고 나머지는 0으로
contrasts(iris$Species, contrasts = F)
#워낫으로 변환?

train.ind <- c(1:50, 100:150)
train.x <- data.matrix(Sonar[train.ind, 1:60])
train.y <- Sonar[train.ind, 61]
test.x <- data.matrix(Sonar[-train.ind, 1:60])
test.y <- Sonar[-train.ind, 61]
mx.set.seed(0)


model <- mx.mlp(
  train.x,
  train.y,
  hidden_node = 10,
  out_node = 2,
  out_activation = 'softmax',
  num.round = 20,
  array.batch.size = 15,
  learning.rate = 0.07,
  momentum = 0.9,
  eval.metric = mx.metric.accuracy
)
#softmax -> 변수가 2개 이상 01,10
#sigmoid -> 노드가 하나인 경우, 0/1인 경우
#num.round = 소수점 20자리
#batch size = 한번에 처리할거면 안주면 됨, 15개 train set에서 돌림
#learning.rate = 학습률, 이전 시점의 w의 변동량에 대해 영향을 미치는 것

preds <- predict(model, test.x) #예측
pred.label <- max.col(t(preds)) - 1
table(pred.label, test.y)
