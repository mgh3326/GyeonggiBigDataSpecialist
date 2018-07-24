library("ggplot2")
library("ggmap")
seoulmap <- get_googlemap("seoul", zoom = 11, maptype = "roadmap")
sp <- ggmap(seoulmap)
print(sp)

getmap <- get_googlemap("seoul")
p1 <- ggmap(getmap)
locationInfo <- data.frame(
  Name = c("서초역", "강남역"),
  lon = c(127.007675, 127.027544),
  lat = c(37.491843, 37.497968)
)
p1 <- p1 + geom_point(data = locationInfo, aes(x = lon, y = lat))
print(p1)

getmap2 <- get_googlemap("gangnamgu", zoom = 12)
p2 <- ggmap(getmap2)
p2 <- p2 + geom_point(data = locationInfo, aes(x = lon, y = lat))
print(p2)

getmap2 <- get_googlemap("gangnamgu", zoom = 12)
p2 <- p2 + geom_point(data = locationInfo, aes(x = lon, y = lat))
p2 <-
  p2 + geom_text(data = locationInfo,
                 aes(label = Name),
                 size = 3,
                 vjust = -1)
print(p2)

locationInfo2 <- data.frame(
  Name = c("강남", "양재", "양재시민의숲", "청계산입구", "판교", "정자"),
  lon = c(
    127.028046,
    127.035140,
    127.038451,
    127.054769,
    127.111172,
    127.108367
  ),
  lat = c(
    37.497001,
    37.483368,
    37.469655,
    37.448196,
    37.394786,
    37.366777
  )
)

getmap3 <- get_googlemap("gwacheon", zoom = 11)
p3 <- ggmap(getmap3)
p3 <- p3 + geom_point(data = locationInfo2, aes(x = lon, y = lat))
p3 <-
  p3 + geom_text(
    data = locationInfo2,
    aes(label = Name),
    size = 4,
    hjust = 1.2,
    fontface = "bold"
  )
p3 <-
  p3 + geom_path(
    data = locationInfo2,
    aes(x = lon, y = lat),
    color = "blue",
    alpha = .5,
    lwd = 1
  )
print(p3)

#1. satellite 위성 지도 스타일
getmap4 <- get_googlemap(maptype = "satellite")
p4 <- ggmap(getmap4)
p4 <- p4 + ggtitle("maptype : satellite")
print(p4)

#2. terrain 스타일
getmap5 <- get_googlemap(maptype = "terrain")
p5 <- ggmap(getmap5)
p5 <- p5 + ggtitle("maptype : terrain")
print(p5)

#3. roadmap 스타일
getmap6 <- get_googlemap(maptype = "roadmap")
p6 <- ggmap(getmap6)
p6 <- p6 + ggtitle("maptype : roadmap")
print(p6)

#4. hybrid 스타일
getmap7 <- get_googlemap(maptype = "hybrid")
p7 <- ggmap(getmap7)
p7 <- p7 + ggtitle("maptype : hybrid")
print(p7)
install.packages("AER")
library(AER)
data("Affairs", package = "AER")
summary(Affairs)
table(Affairs$affairs)

Affairs$ynaffairs[Affairs$affairs > 0] <- 1
Affairs$ynaffairs[Affairs$affairs == 0] <- 0
Affairs$ynaffairs <-
  factor(Affairs$ynaffairs,
         level = c(0, 1),
         labels = c("No", "Yes"))
table(Affairs$ynaffairs)

fit.full <- glm(
  ynaffairs ~ gender + age + yearsmarried + children +
    religiousness + education + occupation + rating,
  data = Affairs,
  family = binomial(link = "logit")
)
summary(fit.full)

fit.reduced <-
  glm(
    ynaffairs ~ age + yearsmarried + religiousness + rating,
    data = Affairs,
    family = binomial(link = "logit")
  )
summary(fit.reduced)
anova(fit.reduced, fit.full, test = "Chisq")
coef(fit.reduced)
exp(coef(fit.reduced))
testdata <- data.frame(
  rating = c(1, 2, 3, 4, 5),
  age = mean(Affairs$age),
  yearsmarried = mean(Affairs$yearsmarried),
  religiousness = mean(Affairs$religiousness)
)
testdata
testdata$prob <-
  predict(fit.reduced, newdata = testdata, type = "response")
testdata

testdata <-
  data.frame(
    rating = mean(Affairs$rating),
    age = seq(17, 57, 10),
    yearsmarried = mean(Affairs$yearsmarried),
    religiousness = mean(Affairs$religiousness)
  )
testdata$prob <-
  predict(fit.reduced, newdata = testdata, type = "response")
testdata

testdata <-
  data.frame(
    rating = mean(Affairs$rating),
    age = mean(Affairs$age),
    yearsmarried = seq(1, 15, 3),
    religiousness = mean(Affairs$religiousness)
  )
testdata$prob <-
  predict(fit.reduced, newdata = testdata, type = "response")
testdata


testdata <-
  data.frame(
    rating = mean(Affairs$rating),
    age = mean(Affairs$age),
    yearsmarried = mean(Affairs$yearsmarried),
    religiousness = seq(1, 5)
  )
testdata$prob <-
  predict(fit.reduced, newdata = testdata, type = "response")
testdata

fit <- glm(
  ynaffairs ~ age + yearsmarried + religiousness + rating,
  data = Affairs,
  family = binomial()
)
fit.od <-
  glm(
    ynaffairs ~ age + yearsmarried + religiousness + rating,
    data = Affairs,
    family = quasibinomial()
  )
q <- summary(fit.od)$dispersion * fit$df.residual
qchisq(q, fit$df.residual, lower = F)

mydata <-
  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(mydata)
summary(mydata)
table(mydata$admit)
table(mydata$gre)
table(mydata$gpa)
table(mydata$rank)
# admit 은 0과 1로만 이루어진것을 알수있다.
plot(mydata$admit)
# mydata$ynadmit[mydata$admit > 0] <- 1
# mydata$ynadmit[mydata$admit == 0] <- 0
# mydata$ynadmit <-
#   factor(mydata$ynadmit,
#          level = c(0, 1),
#          labels = c("No", "Yes"))
# table(mydata$ynadmit)
# 위에 주석은 필요없다리
fit.full <- glm(admit ~ gre + gpa + rank,
                data = mydata,
                family = binomial(link = "logit"))
summary(fit.full)
anova(fit.full, fit.full, test = "Chisq")
testdata <-
  data.frame(
    gre = mean(mydata$gre),
    gpa = mean(mydata$gpa),
    rank = mean(mydata$rank)
  )
# testdata$prop<-predict(fit.full,newdata = testdata,type=testdata)
fitB <- glm(admit ~ gre, rank, data = mydata, family = binomial())
summary(fitB)

library(nnet)
mfit <- multinom(Species ~ ., data = iris)
summary(mfit)
coef(mfit)
exp(coef(mfit))
z <- summary(mfit)$coefficients / summary(mfit)$standard.errors
z
head(fitted(mfit))
predict(mfit, newdata = iris, type = "probs")
pred <- predict(mfit, newdata = iris)
pred == iris$Species
xtabs(~ pred + iris$Species)
install.packages("robust")
library(robust)
data(breslow.dat, package = "robust")
summary(breslow.dat[, c(6, 7, 8, 10)])

opar <- par(no.readonly = TRUE)
par(mfrow = c(1, 2))
attach(breslow.dat)
hist(sumY,
     breaks = 20,
     xlab = "Seizure Count",
     main = "Distribution of Seizures")
boxplot(sumY ~ Trt,
        xlab = "Treatment",
        main = "Group Comparisons")
par(opar)
detach(breslow.dat)
fit <-
  glm(sumY ~ Base + Age + Trt, data = breslow.dat, family = poisson())
summary(fit)
coef(fit)
exp(coef(fit))
deviance(fit) / df.residual(fit)
install.packages("qcc")
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type = "poisson")

# 주성분 분석
library(psych)
pc <- principal(USJudgeRatings[, -1], nfactors = 1)
pc

Harman23.cor
fa.parallel(
  Harman23.cor$cov,
  n.obs = 302,
  fa = "pc",
  n.iter = 100,
  show.legend = FALSE,
  main = "Scree plot with parallel analysis"
)
