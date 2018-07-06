pchisq(0.470024, df = 3)

x <- c(315, 101, 108, 32)
chisq.test(x, p=c(9, 3, 3, 1)/16)

qt(0.05, df = 2)

qchisq(0.95, df = 3)

getwd()

sns.c <- read.csv("snsbyage.csv",
                  header = T,
                  stringsAsFactors = F)
str(sns.c)

sns.c <- transform(sns.c,
                   age.c = factor(age,
                                  levels = c(1,2,3),
                                  labels = c("20대",
                                  "30대", "40대")))
sns.c <- transform(sns.c,
                   service.c = factor(service,
                                  levels = c("F",
                                             "T",
                                             "K",
                                             "C",
                                             "E")))
str(sns.c)                                  
c.tab = table(sns.c$age.c, sns.c$service.c)
a.n <- margin.table(c.tab, margin = 1)
s.n <- margin.table(c.tab, margin = 2)
s.p <- s.n/margin.table(c.tab)
exp <- a.n %*% t(s.p)
o.e <- c.tab - exp
o.e2 <- sum((o.e)^2/exp)

res <- chisq.test(c.tab)
res$expected
chisq.test()
fisher.test()
addmargins(c.tab)


str(UCBAdmissions)
ucba.tab <- apply(UCBAdmissions, c(1,2), sum)
chisq.test(ucba.tab)

ad <- read.csv("age.data.csv", header = T)

str(ad)
summary(ad)

ad$score <- ifelse(ad$score == 99, NA, ad$score)
ad$scale <- factor(ad$scale)
ad$sex <- factor(ad$sex)

#### 집단내 변인 도출 ####
y1 <- ad$age[ad$scale =='1']
y2 <- ad$age[ad$scale =='2']
y3 <- ad$age[ad$scale =='3']

y1.mean = mean(y1)
y2.mean = mean(y2)
y3.mean = mean(y3)

sse.1 <- sum( (y1-y1.mean)^2 )
sse.2 <- sum( (y2-y2.mean)^2 )
sse.3 <- sum( (y3-y3.mean)^2 )

sse <- sse.1 + sse.2 + sse.3
dfe <- (length(y1) - 1) + 
       (length(y2) - 1) + 
       (length(y3) - 1)


### 집단간 변인 도출 ##

y <- mean(ad$age)

ssr.1 <- length(y1) * sum( (y1.mean - y)^2 )
ssr.2 <- length(y2) * sum( (y2.mean - y)^2 )
ssr.3 <- length(y3) * sum( (y3.mean - y)^2 )

ssr <- ssr.1 + ssr.2 + ssr.3
dfr <- length(levels(ad$scale))-1

msr <- ssr/dfr
mse <- sse/dfe

f.t <- msr / mse
qf(1- 0.05, 2, 147)

lm.test <- lm(age ~ scale, data = ad)
anova(lm.test)

install.packages("multcomp")
library(multcomp)

table(cholesterol$trt)

attach(cholesterol)
aggregate(response, by = list(trt), FUN = mean)

fit <- aov(response ~ trt)
summary(fit)
qf(1-0.05, 4, 45)

## 사후검정 ###
Tu.res <- TukeyHSD(fit)
plot(Tu.res)
boxplot(response ~ trt)
png("kk.png")
tuk <-glht(fit, linfct = mcp(trt= "Tukey"))
plot(cld(tuk, level = 0.05), col = "lightgrey")
dev.off()

## 여러집단의 등분산성 검정 ##
install.packages("car")
library(car)

qqPlot(lm(response ~ trt, data = cholesterol),
       simulate = T, labels = F)

bartlett.test(response ~ trt, 
              data = cholesterol)


## 이원요인 분산분석 ##
str(ToothGrowth)
attach(ToothGrowth)
table(supp, dose)

aggregate(len, by = list(supp, dose), 
          FUN = sd)

fit <- aov(len ~ supp * dose)
summary(fit)



fit$



