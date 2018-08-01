install.packages("drat", repos = "https://cran.rstudio.com")
drat::addRepo("dmlc")
install.packages("mxnet")
library(mxnet)

cran <- getOption("repos")
cran["dmlc"] <-
  "https://apache-mxnet.s3-accelerate.dualstack.amazonaws.com/R/CRAN/"
options(repos = cran)
install.packages("mxnet")
library(mxnet)
install.packages("stringi", dependencies = T)
help(package = 'mxnet')
library(mlbench)
data(Sonar, package = "mlbench")
#mxnet은 수치형만을 요구 M,R -> 1,2 -> 0,1
Sonar[, 61] <- as.numeric(Sonar[, 61]) - 1

#dummy 사용
#contrasts(iris$Species,contrasts = T)
#contrasts(iris$Species,contrasts = F)

#mxnet은 matrix형태만 요구
train.ind <- c(1:50, 100:150)
train.x <- data.matrix(Sonar[train.ind, 1:60])
train.y <- Sonar[train.ind, 61]
test.x <- data.matrix(Sonar[-train.ind, 1:60])
test.y <- Sonar[-train.ind, 61]
mx.set.seed(0)
#?mx.mlp hidden_node vector로 들어가기때문에 hidden layer 결정가능
# output이 0,1로만 나오게하려면 sigmoid, output이 a,b 01,10으로 나오게하려면 softmax
model <-
  mx.mlp(
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
preds = predict(model, test.x)
pred.label = max.col(t(preds)) - 1
table(pred.label, test.y)

#=== Deep NN ===
data <- mx.symbol.Variable("data")
fc1 <-
  mx.symbol.FullyConnected(data, name = "fc1", num_hidden = 128)
act1 <- mx.symbol.Activation(fc1, name = 'relu1', act_type = "relu")
fc2 <- mx.symbol.FullyConnected(act1, name = "fc2", num_hidden = 64)
act2 <- mx.symbol.Activation(fc2, name = 'relu2', act_type = "relu")
fc3 <- mx.symbol.FullyConnected(act2, name = "fc3", num_hidden = 10)
softmax <- mx.symbol.SoftmaxOutput(fc3, name = "sm")
devices <- mx.cpu()
mx.set.seed(0)

model <-
  mx.model.FeedForward.create(
    softmax,
    X = train.x,
    y = train.y,
    ctx = devices,
    num.round = 10,
    array.batch.size = 100,
    learning.rate = 0.07,
    momentum = 0.9,
    eval.metric = mx.metric.accuracy,
    initializer = mx.init.uniform(0.07),
    epoch.end.callback = mx.callback.log.train.metric(100)
  )


train <-
  read.csv(
    'https://raw.githubusercontent.com/ozt-ca/tjo.hatenablog.samples/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_train.csv'
  )
test <-
  read.csv(
    'https://raw.githubusercontent.com/ozt-ca/tjo.hatenablog.samples/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_test.csv'
  )

train <- data.matrix(train)
test <- data.matrix(test)
train.x <- train[,-1]
train.y <- train[, 1]
train.x <- t(train.x / 255) #표준화
test_org <- test #원본파일 저장
test <- test[,-1]
test <- t(test / 255)
table(train.y)

preds <- predict(model, test)
dim(preds)

pred.label <- max.col(t(preds)) - 1
table(pred.label)
head(pred.label)
t1 <- table(test_org[, 1], pred.label)
sum(diag(t1)) / sum(t1)
