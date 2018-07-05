sns.c <- read.csv("./data/snsbyage.csv",
                  header = T,
                  stringsAsFactors = F)

str(sns.c)

sns.c <-
  transform(sns.c, age.c = factor(
    age,
    levels = c(1, 2, 3),
    labels = c("20대", "30대", "40대")
  ))
sns.c
str(sns.c)

sns.c <-
  transform(sns.c, service.c = factor(service,
                                      levels = c("F", "T" , "K", "C", "E")))
sns.c
str(sns.c)
c.tab = table(sns.c$age.c, sns.c$service.c)
c.tab
a.n <- margin.table(c.tab, margin = 1)
s.n <- margin.table(c.tab, margin = 2)
s.p <- s.n / margin.table(c.tab)


exp <- a.n %*% t(s.p)
o.e <- c.tab - exp
o.e2 <- sum((o.e) ^ 2 / exp)
chisq.test(c.tab)
options(scipen = 7) # 소수점 자리


res <- chisq.test(c.tab)
res$residuals

str(UCBAdmissions)
table(UCBAdmissions)

ucba.tab <- apply(UCBAdmissions, c(1, 2), sum)
apply(UCBAdmissions, c(1, 2), mean)

chisq.test(ucba.tab)

ad <- read.csv("./data/age.data.csv", header = T)
str(ad)
summary(ad)

ad$score <- ifelse(ad$score == 99, NA, ad$score)
ad$scale <- factor(ad$scale)
ad$sex <- factor(ad$sex)


y1 <- ad$age[ad$scale == '1']
y2 <- ad$age[ad$scale == '2']
y3 <- ad$age[ad$scale == '3']

y1.mean = mean(y1)
y2.mean = mean(y2)
y3.mean = mean(y3)

see.1 <- sum((y1 - y1.mean) ^ 2)
see.2 <- sum((y2 - y1.mean) ^ 2)
see.3 <- sum((y3 - y1.mean) ^ 2)

sse <- see.1 + see.2 + see.3
dfe <- (length(y1) - 1) + (length(y2) - 1) + (length(y3) - 1)
### 집단내 변인 도출 ###
y1 <- mean(ad$age)
ssr.1 <- sum((y1 - y1.mean) ^ 2)
ssr.2 <- sum((y2 - y1.mean) ^ 2)
ssr.3 <- sum((y3 - y1.mean) ^ 2)

ssr <- ssr.1 + ssr.2 + ssr.3
dfr <- length(levels(ad$scale)) - 1
dfr
msr <- ssr / dfr
mse <- sse / dfe
f.t <- msr / mse
qf(1 - 0.05, 2, 147)

lm.test <- lm(age ~ scale, data = ad)
anova(lm.test)

install.packages("multcomp")
library(multcomp)

table(cholesterol$trt)

cholesterol$response
attach(cholesterol)
aggregate(response, by = list(trt), FUN = mean)
fit <- aov(response ~ trt)
summary(fit)

qf(1 - 0.05, 4, 45)
detach(cholesterol)
? TukeyHSD
Tu.res <- TukeyHSD(fit)
plot(Tu.res)
boxplot(response ~ trt)

tuk <- glht(fit, linfct = mcp(trt = "Tukey"))
tuk
plot(cld(tuk, level = 0.05), col = "lightgrey")
## 사후검증 ##
install.packages("car")
library(car)

qqPlot(lm(response ~ trt, data = cholesterol),
       simulate = T,
       labels = F)
bartlett.test(response ~ trt, data = cholesterol)
str(ToothGrowth)

attach(ToothGrowth)
table(supp, dose)

aggregate(len, by = list(supp, dose),
          FUN = mean)
aggregate(len, by = list(supp, dose),
          FUN = sd)

fit <- aov(len ~ supp * dose)
summary(fit)

