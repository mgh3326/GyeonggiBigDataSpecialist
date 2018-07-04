mean.seq <- function(x) {
  n <- length(x)
  sum <- 0
  n2 <- 0
  
  for (i in 1:n) {
    newx <- i * x[i]
    sum <- sum + newx
    n2 <- n2 + i
    
  }
  return(sum / n2)
}

set.seed(1234)
y1 <- rep(NA, 1000)
y2 <- rep(NA, 1000)

for (i in 1:1000) {
  smp <- rnorm(3) #rnorm->무작위로 자료추출
  y1[i] <- mean(smp)
  y2[i] <- mean.seq(smp)
  
}




##비교##
n1 <- length(y1[(y1 > -0.1) & (y1 < 0.1)])
n2 <- length(y2[(y2 > -0.1) & (y2 < 0.1)])


data.frame(mean = mean(y1),
           var = var(y1),
           n = n1)
data.frame(mean = mean(y2),
           var = var(y2),
           n = n2)

data <-
  read.table("http://www.amstat.org/publications/jse/datasets/babyboom.dat.txt",
             header = F)
str(data)

names(data) <- c("time", "gender", "weight", "minutes")
tmp <- subset(data, gender == 1)
weight <- tmp[[3]]

subset(data, gender == 1)
weight <- tmp$weight
t.test(weight)
data <- read.table("./data/chapter6.txt", header = T)
test = "가다, 오다, 먹다"
unlist (stringr::str_split(test, ","))
var.test(data$weight[data$gender == 1],
         data$gender[data$gender == 2])
var.test(data$weight ~ data$gender)


t.test(
  data$weight ~ data$gender,
  mu = 0,
  alternative = "less",
  var.equal = T
)
install.packages("PairedData")
library(PairedData)
t.test(anorexia$Prewt,
       anorexia$Postwt,
       paired = T,
       alternative = "less")
ad <- read.csv("./data/age.data.csv", header = T)
ad
summary(ad)

##

ad$score <- ifelse(
  test = ad$score > 10,
  yes = mean(ad$score, na.rm = T),
  no = ad$score
)
ad$score
new_ad <- ad[complete.cases(ad),]
#이거 왜 안되지
new_ad[!complete.cases(new_ad) , ]
new_ad2 = sapply(ad, function(x)
  ifelse(is.na(x), mean(x, na.rm = T), x))
new_ad2[!complete.cases(new_ad2),]

read.csv("./data/age.data.csv", na.strings = "@")
x  <-  c(315,  101,  108,  32)
chisq.test (x,  p = c(9,  3,  3,  1) / 16)
